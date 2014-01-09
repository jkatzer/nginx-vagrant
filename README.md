## NGINX Vagrant Setup

Need a NGINX HTTP/HTTPS server fast? Vagrant up!
1. Make sure you have installed [Vagrant](http://docs.vagrantup.com/v2/installation/index.html)
and [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Then download this repo.
3. Open your terminal and cd to where you saved this repo.
4. Vargrant up! That's all, simply type in <pre>vagrant up</pre> and your good to go.

Of course you'll have to wait for Ubuntu to download and boot up. Once that finishes up you can use
<pre> vagrant ssh</pre> to tunnel into the machine and do what you like with it.

Once running you'll have an insance of Ubuntu 12.04 LTS 32-bit running with nginx installed. Nginx
is configured to listen for http and https connections on ports 80 and 443 respectively. The virtual machine is configured to allow access at 192.168.13.37.  Assuming everything went according to plan, you should be able to use your favorite browser (on your host machine) to open http(s)://192.168.13.17. You should see a "Welcome to Vagrant" message. 

*Note if you use https you'll get a security warning since nginx is using a self-signed cert.*

