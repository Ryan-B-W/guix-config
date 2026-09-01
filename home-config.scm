;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu services security-token)
  #:use-module (gnu packages polkit)
  #:use-module (gnu system shadow))

(define home-config
  (home-environment
    (services
      (append
        (list
          ;; Uncomment the shell you wish to use for your user:
          (service home-bash-service-type)
          ;(service home-zsh-service-type)

          (service home-files-service-type
           `((".guile" ,%default-dotguile)
             (".Xdefaults" ,%default-xdefaults)))

          (service home-xdg-configuration-files-service-type
           `(("gdb/gdbinit" ,%default-gdbinit)
             ("nano/nanorc" ,%default-nanorc)))

	  (service pcscd-service-type))

        %base-home-services))))

home-config
