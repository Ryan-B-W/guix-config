(define-module (config hosts asimov)
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
  (host-name "asimov")

  (services
   (cons* base-system-guix-publish-service
          %base-system-services))

  (swap-devices (list (swap-space
                        (target (uuid
                                 "72d784a3-fe2f-49f4-9951-ebd86309c55b")))))

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
