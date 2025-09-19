> [!IMPORTANT]
> You must config `AWS S3` bucket policy first to use s3 as a web host


---


1. Amazon S3 > Buckets > [bucket-name] > Properties

    Static website hosting > Edit

    S3 static website hosting

        > Enabled

    Hosting type

        >  Bucket hosting

    Bucket website endpoint

        > `Web url here`

2. Amazon S3 > Buckets > [bucket-name] > Permissions

    Block public access (bucket settings) > Edit

    Block all public access

        > On

    to allow to upload file via [upload.sh](./upload.sh)