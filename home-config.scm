;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services gnupg)
  #:use-module (gnu home services desktop)
  #:use-module (gnu services)
  #:use-module (gnu services security-token)
  #:use-module (gnu packages polkit)
  #:use-module (gnu system shadow))

(define home-config
  (home-environment
    (services
      (append
        (list
          (service home-bash-service-type)

          (service home-dbus-service-type)

          (service home-files-service-type
           `((".guile" ,%default-dotguile)
             (".Xdefaults" ,%default-xdefaults)))

          (service home-xdg-configuration-files-service-type
           `(("gdb/gdbinit" ,%default-gdbinit)
             ("nano/nanorc" ,%default-nanorc)))

          (service home-gpg-agent-service-type
                   (home-gpg-agent-configuration
                    (ssh-support? #t)
                    (extra-content "allow-emacs-pinentry\nallow-loopback-pinentry\nwrite-env-file\nuse-standard-socket"))))

        %base-home-services))))

home-config
