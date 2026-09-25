(define-module (config hosts adams)
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
  #:use-module (config hosts system-base))

(operating-system
  (inherit base-system)
  (host-name "adams")

  (swap-devices (list (swap-space
                        (target (uuid
                                 "b3ae656b-85dc-4b9a-ab7f-d8dbf3c41812")))))

  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "384E-28F3"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/home")
                         (device (uuid
                                  "10ff1238-a5cc-4fe8-8723-874c24c71798"
                                  'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "65b7cc09-f9a9-4312-8340-63b218f437bd"
                                  'ext4))
                         (type "ext4"))
                       %base-file-systems)))
