;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (gnu packages package-management)
             (gnu packages security-token)
             (gnu packages wordnet)
             (guix channels)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg sddm security-token dict)

(define my-channels
  (append
   (list (channel
           (name 'nonguix)
           (url "https://gitlab.com/nonguix/nonguix")
           (introduction
            (make-channel-introduction
             "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
             (openpgp-fingerprint
              "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5")))))
   %default-channels))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/Los_Angeles")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "asimov")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                 (name "brody")
                 (comment "Brody")
                 (group "users")
                 (home-directory "/home/brody")
                 (supplementary-groups '("wheel" "netdev" "audio" "video" "plugdev")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (map specification->package (list
                                                 ;; Desktop environments, window managers, and display managers.
                                                 "stumpwm" "xfce" "sddm"
                                                 ;; Desktop utilities.
                                                 "xdg-utils" "xdg-user-dirs" "xdg-dbus-proxy" "xdg-desktop-portal" "xdg-desktop-portal-gtk" "xdg-desktop-portal-wlr" "xdg-desktop-portal-lxqt" "xdg-desktop-portal-kde"
                                                 ;; Shell utilities.
                                                 "btop" "tmux" "ncdu"
                                                 ;; Editors.
                                                 "emacs" "vim-full" "neovim"
                                                 ;; Programming languages.
                                                 "python"
                                                 ;; Fonts.
                                                 "font-aporetic" "font-iosevka" "font-google-noto" "font-google-noto-emoji" "font-google-noto-sans-cjk" "font-google-noto-sans-hebrew" "font-google-noto-serif-cjk" "font-google-noto-serif-hebrew" "font-awesome-nonfree" "font-liberation" "font-terminus" "font-dejavu" "font-fira-code" "font-fira-mono" "font-fira-sans" "font-adobe-source-code-pro" "font-adobe-source-sans" "font-nerd-symbols"
                                                 ;; Dictionaries and spellcheckers.
                                                 "dictd" "gcide" "vera" "wordnet" "freedict-dictionaries" "hunspell" "hunspell-dict-en" "hunspell-dict-en-us"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service sddm-service-type)
                 (service xfce-desktop-service-type)
                 (udev-rules-service 'fido2 libfido2 #:groups '("plugdev"))
                 (udev-rules-service 'yubikey yubikey-personalization)
                 (service pcscd-service-type)
                 ;; To configure OpenSSH, pass an 'openssh-configuration'
                 ;; record as a second argument to 'service' below.
                 (service openssh-service-type)
                 (service cups-service-type)
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout keyboard-layout))
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
                                             (map dicod-freedict-database (list "eng-deu" "deu-eng" "eng-spa" "spa-eng")))))))
           (modify-services %desktop-services
                            (delete gdm-service-type)
                            (guix-service-type
                             config => (guix-configuration
                                        (inherit config)
                                        (substitute-urls
                                         (append (list
                                                  ;; NonGuix and community servers.
                                                  "https://substitutes.nonguix.org"
                                                  "https://nonguix-proxy.digital.xyz"
                                                  "https://cache-cdn.guix.moe"
                                                  "https://cache-sg.guix.moe"
                                                  "https://guix.tobias.gr")
                                                 ;; Default Guix official servers, "https://bordeaux.guix.gnu.org" and "https://ci.guix.gnu.org".
                                                 %default-substitute-urls))
                                        (authorized-keys
                                         (append (list (local-file "/etc/guix/nonguix-signing-key.pub"))
                                                 %default-authorized-guix-keys))
                                        (channels my-channels)
                                        (guix (guix-for-channels my-channels)))))))
           ;; This is the default list of services we
           ;; are appending to.
           ;%desktop-services))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  ;(initrd-modules (append '("mmc_block" "sdhci_pci") %base-initrd-modules))
  (swap-devices (list (swap-space
                       (target (uuid
                                "72d784a3-fe2f-49f4-9951-ebd86309c55b")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                        (mount-point "/boot/efi")
                        (device (uuid "32A2-6261"
                                       'fat32))
                        (type "vfat"))
                       (file-system
                        (mount-point "/")
                        (device (uuid
                                 "e12dec54-9352-4782-8b4f-778748fce8cf"
                                 'ext4))
                        (type "ext4"))
                       (file-system
                        (mount-point "/home")
                        (device (uuid
                                 "f77063bd-b486-4a47-b550-2cb435428c8b"
                                 'ext4))
                        (type "ext4"))
                       (file-system
                        (mount-point "/mnt/games1")
                        (device (uuid
                                 "edd22bef-ca5f-426b-99b2-91c9cc96b628"
                                 'ext4))
                        (type "ext4"))
                       (file-system
                        (mount-point "/mnt/games2")
                        (device (uuid
                                 "4eff7088-7ba6-4666-b340-4e78e7e89ce7"
                                 'ext4))
                        (type "ext4"))
                       (file-system
                        (mount-point "/mnt/games3")
                        (device (uuid
                                 "fd0c6fbb-fc37-4007-ba28-007d72f3d6b2"
                                 'ext4))
                        (type "ext4"))
                       (file-system
                        (mount-point "/mnt/backup")
                        (device (uuid
                                 "e2a5baa3-5bf6-49f6-b650-245ac05f0963"
                                 'ext4))
                        (type "ext4"))
                       %base-file-systems)))
