

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================"
echo "   Disk and Permission Auditor"
echo "============================================"
echo ""
echo "  Directory              Permissions & Owner        Size"
echo "  --------               -------------------        ----"


for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then

        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "  %-22s %-26s %s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "  %-22s %s\n" "$DIR" "does not exist on this system"
    fi
done

echo ""


echo "  Checking Python3 Install Path..."
echo "  ---------------------------------"

if command -v python3 &>/dev/null; then

    PY_VER=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    PY_DIR="/usr/lib/python${PY_VER}"

    echo "  Python Version : $PY_VER"
    echo "  Lib Directory  : $PY_DIR"
    echo ""

    if [ -d "$PY_DIR" ]; then
        PY_PERMS=$(ls -ld "$PY_DIR" | awk '{print $1, $3, $4}')
        PY_SIZE=$(du -sh "$PY_DIR" 2>/dev/null | cut -f1)
        echo "  Permissions : $PY_PERMS"
        echo "  Size        : $PY_SIZE"
        echo ""
        echo "  Note: Python libraries are owned by root but readable"
        echo "  by all users. This is how Linux handles shared tools safely."
    else
        echo "  Directory $PY_DIR not found."
    fi
else
    echo "  python3 not found on this system."
fi

echo ""
echo "============================================"
