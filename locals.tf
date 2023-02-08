locals {
  vpc_cidr = "10.123.0.0/16"
}
locals {
  security_groups = {
    private = {
      name        = "netapp_sg"
      description = "NetApp Security Group for FSx communication"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nfs_rpc = {
          from        = 111
          to          = 111
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        cifs_rpc = {
          from        = 135
          to          = 135
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        netbios_cifs = {
          from        = 139
          to          = 139
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        snmp = {
          from        = 161
          to          = 161
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        snmp_add = {
          from        = 162
          to          = 162
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        ontap_api = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        smb_tcp = {
          from        = 445
          to          = 445
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nfs_mount = {
          from        = 635
          to          = 635
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        kerberos = {
          from        = 749
          to          = 749
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nfs_daemon = {
          from        = 2049
          to          = 2049
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        isci = {
          from        = 3260
          to          = 3260
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nfs_lock = {
          from        = 4045
          to          = 4045
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        net_statmon = {
          from        = 4046
          to          = 4046
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        ndmp = {
          from        = 10000
          to          = 10000
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        snapmirror = {
          from        = 11104
          to          = 11104
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        snaptransfer = {
          from        = 11105
          to          = 11105
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        nfs_rpc_udp = {
          from        = 111
          to          = 111
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        cifs_rpc_udp = {
          from        = 135
          to          = 135
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        netbios_cifs_udp = {
          from        = 137
          to          = 137
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        snmp_udp = {
          from        = 161
          to          = 161
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        snmp_add_udp = {
          from        = 162
          to          = 162
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        nfs_mount_udp = {
          from        = 635
          to          = 635
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        nfs_daemon_udp = {
          from        = 2049
          to          = 2049
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        nfs_lock_udp = {
          from        = 4045
          to          = 4045
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        nfs_statmon_udp = {
          from        = 4046
          to          = 4046
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
        nfs_quota_udp = {
          from        = 4049
          to          = 4049
          protocol    = "udp"
          cidr_blocks = [var.access_ip]
        }
      }
    }
  }
}