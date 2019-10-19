#include <iostream>

int main() {
    long long seconds, seconds_backup;
    int days, hours, minutes;
    int day_div = 86400, hour_div = 3600, minute_div = 60;

    std::cout << "Enter the number of seconds: ";
    std::cin >> seconds;

    seconds_backup = seconds;
    days = seconds / day_div;
    seconds %= day_div;
    hours = seconds / hour_div;
    seconds %= hour_div;
    minutes = seconds / minute_div;
    seconds %= minute_div;

    std::cout << seconds_backup << " seconds = " << days << " days, " << hours
              << " hours, " << minutes << " minutes, " << seconds << " seconds"
              << std::endl;

    return 0;
}
