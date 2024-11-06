# ---------------------------------------------
# Artifact Registry
# ---------------------------------------------
# Artifact Registryリポジトリの作成
resource "google_artifact_registry_repository" "nextjs_repo" {
  location      = var.gcp_region
  repository_id = var.repository_id
  description   = "Docker repository for Next.js application"
  format        = "DOCKER"
}
