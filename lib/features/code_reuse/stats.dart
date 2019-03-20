const int javaLineCount = 85690;
const int kotlinLineCount = 36249;
const int dartLineCount = 38824;

double linePercentage(int count) =>
    count / (javaLineCount + kotlinLineCount + dartLineCount) * 100;
