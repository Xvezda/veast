BEGIN { flag = 0 }
{
    if (match($0, "Starting Vader") != 0) flag = 1;
    if (flag == 1) print $0;
}
