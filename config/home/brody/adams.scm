(define-module (config home brody adams)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services gnupg)
  #:use-module (gnu home services ssh)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services sound)
  #:use-module (gnu services)
  #:use-module (gnu services security-token)
  #:use-module (gnu packages)
  #:use-module (gnu packages polkit)
  #:use-module (gnu system shadow)
  #:use-module (config packages steam-custom)
  #:use-module (config home brody base)
  #:export (home-config-brody-adams))

(define-public home-config-brody-adams
  (home-environment
   (inherit home-config-brody-base)
   (packages %home-config-brody-base-packages)
   (services %home-config-brody-base-services)))

home-config-brody-adams
