provider "google-beta" {
    credentials = file("/Users/antonpopov/Documents/Develop/security/key.json")
    region      = "europe-west1"
}

provider "google" {
  credentials = file("/Users/antonpopov/Documents/Develop/security/key.json")

  project = "impactful-mode-268210"
  region  = "us-central1"
  zone    = "us-central1-c"
}