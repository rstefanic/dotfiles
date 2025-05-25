{
  user.signingKey ="~/.ssh/id_ed25519.pub";
  "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
  commit.gpgsign = "true";
  gpg.format = "ssh";
}
