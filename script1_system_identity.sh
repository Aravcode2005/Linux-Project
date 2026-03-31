
STUDENT_NAME="Arav"

KERNEL=$(uname -r)

USER_NAME=$(whoami)


HOME_DIR=$HOME

UPTIME=$(uptime -p)


CURRENT_DATE=$(date '+%d-%m-%Y %H:%M:%S')

if [ -f /etc/os-release ]; then
    DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown"
fi

echo "============================================"
echo "   Open Source Audit | $STUDENT_NAME"
echo "   Chosen Software: $SOFTWARE_CHOICE"
echo "============================================"
echo ""
echo "  Distribution  : $DISTRO"
echo "  Kernel        : $KERNEL"
echo "  Logged in as  : $USER_NAME"
echo "  Home          : $HOME_DIR"
echo "  Uptime        : $UPTIME"
echo "  Date/Time     : $CURRENT_DATE"
echo ""
echo "  OS License    : GNU General Public License v2 (GPL v2)"
echo "  Python License: Python Software Foundation License (PSF)"
echo ""
echo "  Both licenses allow anyone to read, use, modify"
echo "  and share the code freely - that is the whole point."
echo ""
echo "============================================"
