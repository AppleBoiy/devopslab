# Custom Domain for GitHub Pages

configured [gh-site.apeboi.in](https://gh-site.apeboi.in) as custom domain in the GitHub Pages.

## add domain to gh account

1. go to https://github.com/settings/pages

    <img src="https://raw.githubusercontent.com/AppleBoiy/devopslab/refs/heads/main/images/gh/dns/add-domain.png" width="600"/>

2. proceed to add domain

    > if you proceed correctly you should see ->

    <img src="https://raw.githubusercontent.com/AppleBoiy/devopslab/refs/heads/main/images/gh/dns/successfully.png" width="600"/>

3. change the domain of gh pages -> `<repo>/settings`

    <img src="https://raw.githubusercontent.com/AppleBoiy/devopslab/refs/heads/main/images/gh/dns/change-domain.png" width="600"/>


## dns provider setting

add DNS record

|Type	| Name	| Content |
| --- | --- | --- |
| CNAME	| `[<sub>.]<domain>` |	`<usr>`.github.io |


then -> follower official docs: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site


