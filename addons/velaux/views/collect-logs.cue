import (
	"vela/ql"
)

collectLogs: ql.#CollectLogsInPod & {
	cluster:   parameter.cluster
	namespace: parameter.namespace
	pod:       parameter.pod
	options: {
		container:     parameter.container
		previous?:     parameter.previous
		sinceSeconds?: parameter.sinceSeconds
		sinceTime?:    parameter.sinceTime
		timestamps?:   parameter.timestamps
		tailLines?:    parameter.tailLines
		limitBytes?:   parameter.limitBytes
	}
}
status: collectLogs.outputs

parameter: {
	// +usage=Specify the cluster of the pod
	cluster: string
	// +usage=Specify the namespace of the pod
	namespace: string
	// +usage=Specify the name of the pod
	pod: string

	// +usage=Specify the name of the container
	container: string
	// +usage=If true, return previous terminated container logs
	previous: *false | bool
	// +usage=If set, show logs in relative times
	sinceSeconds: *null | int
	// +usage=RFC3339 timestamp, if set, show logs since this time
	sinceTime: *null | string
	// +usage=If true, add timestamp at the beginning of every line
	timestamps: *false | bool
	// +usage=If set, return the number of lines from the end of logs
	tailLines: *null | int
	// +usage=If set, limit the size of returned bytes
	limitBytes: *null | int
}
