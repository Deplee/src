//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
        {"Battery:", "acpi | awk '{print $4}' | sed 's/,//g'", 5, 0},
        {"SDD:", "df -h | grep /dev/nvme0n1p3 | awk '{print $3\"/\"$2}'", 30, 0},
        {"HDD:", "df -h | grep /dev/sda | awk '{print $3\"/\"$2}'", 30, 0},
	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"Swap:", "free -h | awk '/^Swap/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
};
//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;

