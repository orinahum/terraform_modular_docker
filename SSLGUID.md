<img src="assets/SSLGUID.png" alt="SSLGUID.md" style="width: 100%; height: 250px;">

# 

# Guide: Generating a Self-Signed SSL Certificate and Key

To set up SSL for your NGINX server, you’ll need two files:
- **A private key** (`server.key`)
- **A certificate** (`server.crt`)

You can generate these files using the `openssl` command, which is available on most systems. Follow these steps:

## Steps to Generate SSL Certificate and Key

1. **Open your terminal** and navigate to the `nginx/ssl/` directory where you want to store the SSL files.

2. **Run the following command** to generate a self-signed certificate and private key:

   ```bash
   openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes

3. **You’ll be prompted to enter some information about the certificate**: like country, state, and organization. This information will be embedded in the certificate. Here’s an example of the questions and answers:

    ```
    Country Name (2 letter code) [AU]: US
    State or Province Name (full name) [Some-State]: California
    Locality Name (eg, city) []: Los Angeles
    Organization Name (eg, company) [Internet Widgits Pty Ltd]: MyCompany
    Organizational Unit Name (eg, section) []: IT Department
    Common Name (e.g. server FQDN or YOUR name) []: localhost
    Email Address []: admin@mycompany.com
    ```

    - Common Name: For local development, you can use localhost. For production, this would be the domain name of your server.

4. **After completing these steps**: you’ll find the following two files in your current directory:

    - `server.key` — The private key
    - `server.crt` — The self-signed SSL certificate

    > Place the files in the nginx/ssl/ directory of your project if you’re not already there. The nginx container will use these files to serve content over HTTPS.

# Important Note
This certificate is self-signed and should only be used for local development or testing. Browsers may show a warning about the certificate being untrusted. For production environments, it’s best to obtain a certificate from a trusted Certificate Authority (CA) like `Let’s Encrypt`, which offers free SSL certificates.