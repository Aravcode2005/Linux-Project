
PACKAGE="python3"

echo "============================================"
echo "   FOSS Package Inspector"
echo "============================================"
echo ""
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "  [FOUND] $PACKAGE is installed on this system."
    echo ""

    # pulling version info using dpkg-query
    VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
    echo "  Version     : $VERSION"

    # showing a short description from dpkg
    DESCRIPTION=$(dpkg-query -W -f='${Description}' "$PACKAGE" 2>/dev/null | head -1)
    echo "  Description : $DESCRIPTION"

    # finding where python3 binary actually lives
    LOCATION=$(which python3 2>/dev/null)
    echo "  Location    : $LOCATION"

else
    echo "  [NOT FOUND] $PACKAGE is not installed."
    echo ""
    echo "  You can install it by running:"
    echo "    sudo apt install python3"
fi

echo ""

# case statement to print a philosophy line based on package name
# this shows i understand what each tool stands for
echo "  Open Source Philosophy:"
echo "  -----------------------"
case $PACKAGE in
    python3|python)
        echo "  Python was created by Guido van Rossum and has been"
        echo "  shaped entirely by its community. No single company owns it."
        ;;
    git)
        echo "  Linus built Git because the proprietary tool he used"
        echo "  got its free license revoked. Open source was his answer."
        ;;
    firefox)
        echo "  Firefox exists because Mozilla believed the web"
        echo "  should not be owned by any one company."
        ;;
    apache2|httpd)
        echo "  Apache helped build the open internet - it still powers"
        echo "  a huge chunk of websites today."
        ;;
    vlc)
        echo "  VLC was built by students in Paris who just wanted"
        echo "  to stream video on their campus network. Now everyone uses it."
        ;;
    *)
        echo "  Every open source tool exists because someone decided"
        echo "  to share their work instead of locking it away."
        ;;
esac

echo ""
echo "============================================"
