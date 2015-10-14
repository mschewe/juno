package version

var (
	Version    = "1.0.0"
	CommitHash = "dev"
)

func PrintVersion() string {
	return Version + "-" + CommitHash
}
