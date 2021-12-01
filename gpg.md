# GPG with Keybase.io

This doc will get GPG set up on your work computer with your work email. Install the keybase app before beginning. Then
continue forward.

```sh
brew install gnupg
```

Download Private and Public Key from Keybase.io (edit Button next to Key on Profile, Export my Private Key, Key Checksum for Export of Public Key)

```sh
gpg --allow-secret-key-import --import keybase-private.key
gpg --import keybase-public.key
gpg --edit-key myname@keybase.io
```

then in the gnupg ‘shell’:

```text
gpg> adduid
Real name: Full Name
Email address: myname@mymail.com
Comment: <leave empty, hit enter>
Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
```

You'll need to enter your Key to allow the changes.

Stay in gpg shell and do following to trust yourself (maybe not necessary):

```text
gpg> uid myname@mymail.com
gpg> trust
sec  rsa4096/xxxxxxxxxxxxxxxx
     created: 2019-07-23  expires: 2035-07-19  usage: SC
     trust: ultimate      validity: ultimate
ssb  rsa4096/yyyyyyyyyyyyyyyy
     created: 2019-07-23  expires: 2035-07-19  usage: E
[ultimate] (1). Chris Gilmer <myname@mymail.com>
[ unknown] (2)  Chris Gilmer <mynewname@mymail.com>

Please decide how far you trust this user to correctly verify other users' keys
(by looking at passports, checking fingerprints from different sources, etc.)

  1 = I don't know or won't say
  2 = I do NOT trust
  3 = I trust marginally
  4 = I trust fully
  5 = I trust ultimately
  m = back to the main menu

Your decision? 4
gpg> save
```

Export your newly generated public key:

```sh
gpg --armor --export myname@mymail.com
```

Upload to Github for Sign (New GPG key): https://github.com/settings/keys

Upload Public Key to Keybase: https://keybase.io/myname (edit, Update my key)

```sh
keybase pgp update
```

You can sign now on Github with:

```sh
git commit -S -m "signed commit"
```

## Troubleshooting

If you have issues try this.

### Error with keybase update

If you run into an error with keybase update try this:

```sh
gpg --expert --edit-key myname@mymail.com
```

```text
gpg> setpref AES AES256 CAST5 3DES SHA256 SHA512 SHA1 RIPEMD160 ZIP ZLIB ks-modify no-mdc
Set preference list to:
     Cipher: AES, AES256, CAST5, 3DES
     AEAD:
     Digest: SHA256, SHA512, SHA1, RIPEMD160
     Compression: ZIP, ZLIB, Uncompressed
Really update the preferences? (y/N) y
gpg> save
```

```sh
keybase pgp update
```

References:
* [ERROR key generation error: Unknown signature subpacket: 34 (error 905), gpg (GnuPG) 2.3.1 libgcrypt 1.9.3](https://github.com/keybase/keybase-issues/issues/4025)
