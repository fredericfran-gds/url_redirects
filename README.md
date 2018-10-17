# Transition Data Checker For Bouncer

## Aims

This utility is used to:
1. make URL requests to the bouncer component of Gov.uk and retrieve the HTTP
code and URL redirect
2. the original URL to be used in each HTTP request is obtained from a file that
is fed to this utility
3. the bouncer instance/server is fronted by an elastic load balancer in AWS and
the entry point of this load balancer must be used as the address of bouncer

## Usage

Usage of the utility is:
```
./collect_redirects.sh -i <input_file> -o <output_file> -b <bouncer_url>
```
where:
1. <input_file> is the input file where the URLs to be tested are.
   The format of the file is one URL per line in the text file.
   An example of such as file is [here](hosts_list.txt)
2. <output_file> is the output file where the result of the HTTP requests are stored.
   The format of the file is `<original_input_url> <http_code> <http_redirect_url>`
   where:
   1. `<original_input_url>` is the original input URL
   2. `<http_code>` is the HTTP code of the HTTP response
   3. `<http_redirect_url>` is the HTTP redirect URL that was obtained
   An example of such a file is [here](results_staging.txt)

### Bouncer Entry Points

A list of entry points are available [here](Bouncers_list.md)
