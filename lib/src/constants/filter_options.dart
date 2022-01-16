// value-label pairs

const Map<num, String> prices = {
  0: "Free",
  1: "  \$  ",
  2: " \$\$ ",
  3: "\$\$\$",
  4: "\$\$\$\$",
};

const Map<num, String> distances = {
  1000: "< 1km",
  5000: "< 5km",
  10000: "< 10km",
  25000: "< 25km",
  50000: "< 50km",
  0: "Any",
};

//date int in milliseconds from now
const Map<num, String> dates = {
  86400000: "Today",
  172800000: "Tomorrow",
  604800000: "This week",
  1209600033: "Next 2 weeks",
  2629800000: "This month",
  7889400000: "Next 3 months",
  15778800000: "Next 6 months",
  0: "Any",
};
