this repo is for hosting laravel with docker and nginx:
# new Termenologyies
* **FastCGI Process Manager**

  
FastCGI Process Manager (FPM) is a popular alternative to the traditional Common Gateway Interface (CGI) method for executing PHP scripts on web servers. FPM is a PHP FastCGI daemon that provides a number of benefits over CGI, including:

1. Better performance: FPM can handle multiple requests in a single PHP process, reducing the overhead of creating and destroying a new PHP process for every request. This can result in faster response times and lower resource usage.

2. Improved stability: FPM can automatically recycle PHP processes after a certain number of requests or a certain amount of time, helping to prevent memory leaks and other issues that can arise with long-running PHP processes.

3. Fine-grained process management: FPM allows for granular control over the number of PHP processes that are running, as well as the maximum number of requests each process can handle before being recycled. This can help to optimize resource usage and prevent overloading of the server.

4. Easy integration with web servers: FPM can be easily integrated with popular web servers like Apache and Nginx, allowing for seamless execution of PHP scripts alongside other web server functionality.

FPM is typically used in conjunction with a web server and a FastCGI implementation, such as mod_fastcgi for Apache or the FastCGI Process Manager for Nginx. By using FPM, web developers can achieve better performance and stability for their PHP applications, while also having greater control over the PHP process management.

* **PHP OPcache**

PHP OPcache is an opcode cache for PHP that can significantly improve the performance of PHP-based web applications. OPcache is a built-in extension in PHP versions 5.5 and later that caches the compiled bytecode of PHP scripts in memory, which reduces the amount of time it takes to execute the same script multiple times.

Here are some key features of PHP OPcache:
* Improved performance: By caching the compiled bytecode of PHP scripts in memory, OPcache reduces the amount of time it takes to execute the same script multiple times, which can significantly improve the performance of PHP-based web applications.
* Reduced server load: By reducing the amount of time it takes to execute PHP scripts, OPcache can help to reduce the server load and improve the overall scalability of web applications.
* Lower memory usage: Because OPcache stores the compiled bytecode of PHP scripts in memory, it can reduce the amount of memory required to execute PHP scripts, which can be particularly useful in environments with limited resources.
 
 ## Project summary
 
 by using fdm and opcash options we can host laravel on nginx faster (takes 50 ms) than nginx only (takes 500 ms).
 
 points to consider:-
 * *php.ini* is the file where it contain the configration to opcache.
 * *php-fpm.conf* is file for fast cgi configration.
 * *nginx.conf* here nginx configration and uses fast cgi an up stream server.
 * both Dockerfie and compose are normal for laravel containerization with the exception of:-
    1. the docker file is rootless and is run by **www-data**.
    2. the image used is **php8.1-fpm** which helps us implement fastCGI and integrate nginx easly.
