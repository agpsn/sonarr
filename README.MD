<!--:latest = ![1](https://img.shields.io/github/v/tag/Sonarr/Sonarr?color=00CCFF&label=&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAkFBMVEUAAADv7%2B%2Fw8PBPb4Pu7u7v7%2B%2Fu7u7u7u6Kipru7u7u7u7u7u7v7%2B%2FV1djR0tXj4%2BXo6Oru7u5QbYLw8PDs7Ozu7u4AzP86P1FqbnszT2VdYXB1eIQfgKEyUmg7SVvp6erY2Nrd3uBOV2cZjrNUXW1kaHY1TWJLUWGEh5IciawwWHDLzNAjd5YvWXHBwsZtcX4knsCmAAAAFXRSTlMAMDLylZr3%2FhDY8%2FXZpaOcntzzNDXa%2BIbYAAAAsUlEQVR42k2P5w7DIAyEaRZJMzsIZAPZs%2B%2F%2FdjWgSv1%2BWPYJHz6kuDlBGEaOhQx%2BiokGZ76ebdYZoaueSomHbeQEEGyTCUIvLIa6ZcvC2lVyfEMuIXtT06Kg9bQT4qAAHpe0z%2FOVltAGyINaNTlQfKC9%2FwuVFh5QR7XSmxVlKtqDNmDacmX6xh2rp7ks5%2BkYO%2FgWZdU5XwS45MlSfbrkRCMG24RJfuFimDWWG3le4Or4XzKUEz52Mbu3AAAAAElFTkSuQmCC&logoColor=00CCFF&style=plastic)  -->


```
docker run -d \
  --name=sonarr \
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=UTC \ #optional
  -e UMASK=022 \  #optional
  -p <hostport>:8989 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \ #optional
  --restart unless-stopped \  #optional
  ghcr.io/agpsn/alpine-sonarr:latest
