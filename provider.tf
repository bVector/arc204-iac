provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

provider "statuscake" {
    username = "${var.statuscake_user}"
    apikey = "${var.statuscake_key}"
}