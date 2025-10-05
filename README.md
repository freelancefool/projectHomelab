# homelab
This is my attempt at a home lab. I will set some goals, have a configuration section, and then an explanation about why I'm doing things one way and what changes or plans I'll have for it in the future.

I did initially consider using kubernetes, but it seems like overkill since I don't really have a good understanding of docker and how it is managed.

## Goals

1. Get better with docker.
    1. I understand the basics of volumes, bind mounts, and some basics for docker compose.
        * Better understand the difference between volumes and bind mounts and when to use them. 
    2. Learn docker compose. 
        * I barely understand how to build a compose file. I need to learn more options for this and how to use it better.
2. Configure microservices for home.
    1. Splunk.
    2. httpd.
    3. SC4S.
    4. Ansible.
    5. Clay's microservices.
        * Something to query the solar gateway.
        * Something to query the ecobee.
3. Learn Ansible
    1. Build this homelab with the goal being to deploy it from GitHub to production.
    2. Figure out how to do this. Ansible will probably be a big player with this.
    3. GitHub Actions will probably also help with the deployment aspect.
    4. Build a dev enviroment?
        * When we get to the point where I am try automation for testing, I will probably buy a NUC-clone to have a second host at home.

## Configuration

I've been playing with Docker on and off on my Intel NUC. I'll probably miss some steps about how I got that installed here.

### Let's Encrypt

If possible, I would like to have real TLS certificates. In order to do so, I'll document everything I'm doing to make this automation work.

#### Cloudflare

I'm probably insane for doing this, but Cloudflare offers automated DNS record updates so I can get TLS certificates through an automatic fashion without needing to expose the host externally. This is a good thing, because I cannot host anything locally on port 80 or 443. It's blocked by my ISP because they're sane. So I'm doing this as a way to handle TLS certs instead of offering up a hidden file for the certificate provider to download to validate I own the host and domain.