## Connect to Your Fresh Amazon EC2 Instance

Follow these steps to connect to a newly created Amazon EC2 server using SSH.


## 1. Prerequisites

* An **EC2 instance** running on AWS.
* The **key pair (.pem file)** you selected or created when launching the instance.
* Your EC2 instance’s **public IPv4 address** (visible in the AWS console).
* `ssh` installed locally (macOS, Linux, WSL on Windows).


## 2. Set Permissions on Your Key File

AWS requires your private key file (`.pem`) to have restrictive permissions:

```bash
chmod 400 my-key.pem
```


## 3. Connect to the Server

Run the SSH command:

```bash
ssh -i my-key.pem ec2-user@<your-public-ip>
```

* Replace `my-key.pem` with your key filename.
* Replace `<your-public-ip>` with the actual public IPv4 address of your instance.
* The default username depends on the AMI:

  * **Amazon Linux 2** → `ec2-user`
  * **Ubuntu** → `ubuntu`
  * **Debian** → `admin` or `debian`
  * **CentOS** → `centos`
  * **RHEL** → `ec2-user`

Example:

```bash
ssh -i my-key.pem ubuntu@54.210.12.34
```


## 4. (Optional) Save to SSH Config

To avoid typing the full command every time, add an entry in `~/.ssh/config`:

```ssh-config
Host my-ec2
    HostName 54.210.12.34
    User ubuntu
    IdentityFile ~/my-key.pem
```

Now connect with:

```bash
ssh my-ec2
```


## 5. Common Troubleshooting

* **Permission denied (publickey)**
  → Ensure you are using the correct username for the AMI.

* **Key permissions too open**
  → Run `chmod 400 my-key.pem`.

* **Timeout / no route**
  → Check your **security group** allows inbound SSH (port 22) from your IP.

