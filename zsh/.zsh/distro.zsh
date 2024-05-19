MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f /etc/os-release || -f /etc/lsb-release ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"
fi

_hostname=$(hostname)

if [[ $_hostname == *rpi* || $_hostname == *raspberry* ]]; then
  _distro="raspbian"
fi

if [[ -d /etc/pve ]]; then
  _distro="proxmox"
fi

case $_distro in
*kali*) ICON="" ;;
*arch*) ICON="" ;;
*debian*) ICON="" ;;
*proxmox*) ICON="" ;;
*raspbian*) ICON="" ;;
*ubuntu*) ICON="" ;;
*elementary*) ICON="" ;;
*fedora*) ICON="" ;;
*coreos*) ICON="" ;;
*gentoo*) ICON="" ;;
*mageia*) ICON="" ;;
*centos*) ICON="" ;;
*opensuse* | *tumbleweed*) ICON="" ;;
*sabayon*) ICON="" ;;
*slackware*) ICON="" ;;
*linuxmint*) ICON="" ;;
*alpine*) ICON="" ;;
*aosc*) ICON="" ;;
*nixos*) ICON="" ;;
*devuan*) ICON="" ;;
*manjaro*) ICON="" ;;
*rhel*) ICON="" ;;
*macos*) ICON="" ;;
*) ICON="" ;;
esac

export DISTRO="$_distro"
export DISTRO_ICON="$ICON"
