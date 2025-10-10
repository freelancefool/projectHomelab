# homelab
This is my attempt at a home lab. I will set some goals, have a configuration section, and then an explanation about why I'm doing things one way and what changes or plans I'll have for it in the future.

I did initially consider using kubernetes, but it seems like overkill since I don't really have a good understanding of docker and how it is managed.

## Goals

1. Get better with docker.
    1. I understand the basics of volumes, bind mounts, and some basics for docker compose.
        * Better understand the difference between volumes and bind mounts and when to use them. 
    2. What is a Dockerfile?
        * The Apache httpd docs mention using a Dockerfile to build images instead of copying files. This is something else to learn. Probably as a mid-step to get to compose.
    3. Learn docker compose. 
        * I barely understand how to build a compose file. I need to learn more options for this and how to use it better.
2. Configure microservices for home.
    1. httpd.
    2. Splunk.
    3. SC4S.
    4. Ansible.
    5. nginx.
    6. freelancefool's microservices.
        * Something to query the solar gateway.
        * Something to query the ecobee.
3. Learn Ansible
    1. Build this homelab with the goal being to deploy it from GitHub to production.
    2. Figure out how to do this. Ansible will probably be a big player with this.
    3. GitHub Actions will probably also help with the deployment aspect.
    4. Build a dev enviroment?
        * When we get to the point where I am try automation for testing, I will probably buy a NUC-clone to have a second host at home.
4. Learn GitHub
    1. I understand how version control works at a basic level.
    2. I have no idea how tagging works with releases.
    3. I have no idea how Projects works with timelines.


## Configuration

I've been playing with Docker on and off on my Intel NUC. I'll probably miss some steps about how I got that installed here.

### SC4S

The Splunk documents for SC4S need a couple host level changes.

Add the following to `/etc/sysctl.conf`
```
net.core.rmem_default = 17039360
net.core.rmem_max = 17039360
```

Apply to kernel:
```
sysctl -p 
```

The rest of the configuration for SC4S can be found at the following link:
https://splunk.github.io/splunk-connect-for-syslog/main/gettingstarted/quickstart_guide/

The system level changes are being documented in this README.md. I'm treating it both as a repo that can be viewed/used by anyone who finds it, as well as documentation for this project. 

### Let's Encrypt

If possible, I would like to have real TLS certificates. In order to do so, I'll document everything I'm doing to make this automation work.

#### Cloudflare

I'm probably crazy for doing this, but Cloudflare offers automated DNS record updates so I can get TLS certificates through an automatic fashion without needing to expose the host externally. This is a good thing, because I cannot host anything locally on port 80 or 443. It's blocked by my ISP because they're sane. So I'm doing this as a way to handle TLS certs instead of offering up a hidden file for the certificate provider to download to validate I own the host and domain.