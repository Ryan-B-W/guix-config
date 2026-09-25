(define-module (config hosts system-base)
  #:use-module (gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu services base)
  #:use-module (gnu services linux)
  #:use-module (gnu services sysctl)
  #:use-module (gnu services cups)
  #:use-module (gnu services desktop)
  #:use-module (gnu services sound)
  #:use-module (gnu services networking)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)
  #:use-module (gnu services sddm)
  #:use-module (gnu services security-token)
  #:use-module (gnu services dict)
  #:use-module (nongnu packages)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu system linux-initrd)

  #:export (base-system)
  #:export (v4l2loopback-configuration)
  #:export (%base-system-packages)
  #:export (%base-system-services)
  #:export (%base-system-users)
  #:export (base-system-guix-publish-service))

(define-public base-v4l2loopback-configuration
  (plain-file "v4l2loopback.conf"
              "devices=2 max_buffers=2 exclusive_caps=1,1 video_nr=90,91 card_label=loopback-0,loopback-1"))

(define-public %base-system-packages
  (append (map specification->package (list
                                       ;; Acceleration hardware.
                                       "mesa" "mesa-utils" "vulkan-loader" "vulkan-tools" "spirv-tools" "glslang"
                                       "xf86-video-amdgpu" "amdgpu-firmware"
                                       ;; Audio/video.
                                       "v4l2loopback-linux-module"
                                       "libva-utils" "vdpauinfo"
                                       "pipewire" "wireplumber"
                                       "qpwgraph" "easyeffects"
                                       ;; Desktop environments, window managers, and display managers.
                                       "stumpwm" "sway" "xfce" "sddm" "picom"
                                       ;; Desktop utilities.
                                       "xdg-utils" "xdg-user-dirs" "xdg-dbus-proxy" "xdg-desktop-portal" "xdg-desktop-portal-gtk" "xdg-desktop-portal-wlr" "xdg-desktop-portal-lxqt" "xdg-desktop-portal-kde"
                                       "bemenu" "mako" "wayvnc" "waypipe" "kanshi" "wl-clipboard" "slurp" "grim" "grimshot"
                                       "swaybg" "waybar" "swaylock" "swayidle" "wlroots" "wlr-randr"
                                       "tigervnc-client" "tigervnc-server" "x11vnc" "freerdp"
                                       "xtrlock" "xclip" "password-store" "pass-otp"
                                       ;; Shell utilities.
                                       "kitty" "rxvt-unicode" "xterm" "libvterm"
                                       "btop" "tmux" "ncdu" "fastfetch" "git"
                                       "openssh" "mosh" "rsync" "rclone" "curl" "wget2"
                                       ;; Editors.
                                       "emacs" "vim-full" "neovim"
                                       ;; Programming languages.
                                       "gcc-toolchain" "clang-toolchain" "guile" "bash" "sbcl" "python"
                                       ;; Fonts.
                                       "font-aporetic" "font-iosevka"
                                       "font-google-noto" "font-google-noto-emoji" "font-google-noto-sans-cjk" "font-google-noto-sans-hebrew" "font-google-noto-serif-cjk" "font-google-noto-serif-hebrew"
                                       "font-nerd-symbols" "font-awesome-nonfree"
                                       "font-liberation" "font-terminus" "font-dejavu"
                                       "font-fira-code" "font-fira-mono" "font-fira-sans"
                                       "font-adobe-source-code-pro" "font-adobe-source-sans"
                                       ;; Dictionaries and spellcheckers.
                                       "hunspell" "hunspell-dict-en" "hunspell-dict-en-us"
                                       "dictd" "gcide" "vera" "wordnet" "freedict-dictionaries"))
          %base-packages))

(define-public %base-system-services
  (cons*
   (service kernel-module-loader-service-type
            (list
             ;; v4l2loopback configuration.
             "v4l2loopback"))
   (simple-service 'v4l2loopback-configuration etc-service-type
                   (list `("modprobe.d/v4l2loopback.conf" ,base-v4l2loopback-configuration)))
   (service pam-limits-service-type
            (list
             ;; General limit increases.
             (pam-limits-entry "*" 'both 'memlock 4194304)
             ;; For compatibility with Wine/Proton Esync and other software that requires a very large number of file descriptors.
             (pam-limits-entry "@users" 'hard 'nofile 1048576)
             (pam-limits-entry "@users" 'soft 'nofile 524288)
             ;; For pseudo-realtime/low-latency service support.
             (pam-limits-entry "@realtime" 'both 'rtprio 99)
             (pam-limits-entry "@realtime" 'both 'memlock 'unlimited)))

   (service sddm-service-type)
   (service xfce-desktop-service-type)
   (service gvfs-service-type)
   (udev-rules-service 'fido2 libfido2 #:groups '("plugdev"))
   (udev-rules-service 'yubikey yubikey-personalization)
   (service pcscd-service-type)
   ;; To configure OpenSSH, pass an 'openssh-configuration'
   ;; record as a second argument to 'service' below.
   (service openssh-service-type
            (openssh-configuration
             (port-number 22)
             (max-connections 200)
             (permit-root-login #f)
             (accepted-environment (list
                                    ;; Terminal emulator environment.
                                    "TERM" "COLORTERM"
                                    ;; Language and localization.
                                    "LANG" "LC_ALL" "LC_COLLATE" "LC_CTYPE" "LC_MESSAGES" "LC_MONETARY" "LC_NUMERIC" "LC_TIME" "LANGUAGE" "LC_ADDRESS" "LC_IDENTIFICATION" "LC_MEASUREMENT" "LC_NAME" "LC_PAPER" "LC_TELEPHONE"))
             (authorized-keys '())
             (log-level 'info)
             (extra-content "")))
   (service cups-service-type)
   (set-xorg-configuration
    (xorg-configuration (keyboard-layout (keyboard-layout "us")))
    sddm-service-type)
   (service dicod-service-type
            (dicod-configuration
             (handlers (list (dicod-handler
                              (name "wordnet")
                              (module "wordnet")
                              (options (list #~(string-append "wnhome=" #$wordnet))))))
             (databases (cons* (dicod-database (name "wordnet")
                                               (complex? #t)
                                               (handler "wordnet"))
                               %dicod-database:gcide
                               (map dicod-freedict-database
                                    (list "eng-deu" "deu-eng"
                                          "eng-spa" "spa-eng"))))))
   (modify-services %desktop-services
                    (sysctl-service-type
                     config => (sysctl-configuration
                                (settings (cons* '("kernel.pid_max" . "257256")
                                                 '("vm.swappiness" . "0")
                                                 %default-sysctl-settings))))
                    (delete gdm-service-type)
                    (delete pulseaudio-service-type)
                    (guix-service-type
                     config => (guix-configuration
                                (inherit config)
                                (substitute-urls
                                 (append (list
                                          ;; NonGuix and community servers.
                                          "https://substitutes.nonguix.org"
                                          "https://nonguix-proxy.digital.xyz"
                                          "https://cache-cdn.guix.moe"
                                          "https://cache-us-lax.guix.moe"
                                          "https://guix.tobias.gr"
                                          "https://bordeaux-us-east-mirror.cbaines.net/")
                                         ;; Default Guix official servers, "https://bordeaux.guix.gnu.org" and "https://ci.guix.gnu.org".
                                         %default-substitute-urls))
                                (authorized-keys
                                 (cons* (local-file "../guix-signing-keys/nonguix-signing-key.pub")
                                        (local-file "../guix-signing-keys/asimov-signing-key.pub")
                                        (local-file "../guix-signing-keys/adams-signing-key.pub")
                                        %default-authorized-guix-keys)))))))

(define-public base-system-guix-publish-service
  (service guix-publish-service-type
           (guix-publish-configuration
            (port 9070)
            (host "0.0.0.0")
            (advertise? #t))))

(define-public %base-system-users
  (cons* (user-account
          (name "brody")
          (uid 1000)
          (comment "Brody")
          (group "users")
          (home-directory "/home/brody")
          (supplementary-groups '("wheel" "netdev" "audio" "video" "plugdev")))
         %base-user-accounts))

(define-public base-system
  (operating-system
   (kernel linux)
   (initrd microcode-initrd)
   (firmware (list linux-firmware))
   (locale "en_US.utf8")
   (timezone "America/Los_Angeles")
   (keyboard-layout (keyboard-layout "us"))
   (host-name "base-system")

   ;; The list of user accounts ('root' is implicit).
   (users %base-system-users)

   ;; Packages installed system-wide.  Users can also install packages
   ;; under their own account: use 'guix search KEYWORD' to search
   ;; for packages and 'guix install PACKAGE' to install a package.
   (packages %base-system-packages)

   ;; Below is the list of system services.  To search for available
   ;; services, run 'guix system search KEYWORD' in a terminal.
   (services %base-system-services)

   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (file-systems %base-file-systems)))
