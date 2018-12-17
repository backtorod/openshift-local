OC_CLUSTER_HOME="${HOME}/.openshift"

OC_CONFIG_DIR="$(OC_CLUSTER_HOME)/_cluster_config"
OC_DATA_DIR="$(OC_CLUSTER_HOME)/_cluster_data"
OC_ENABLE_LOGGING=true
OC_ENABLE_METRICS=true
OC_ENABLE_SERVICE_CATALOG=true
OC_IMAGE_STREAMS=centos7
OC_PV_DIR="$(OC_CLUSTER_HOME)/_cluster_pv"
OC_ROUTING_SUFFIX=127.0.0.1.nip.io
OC_USE_EXISTING_CONFIG=true
OC_VERSION=v3.6.0
OC_VOLUMES_DIR="$(OC_CLUSTER_HOME)/_cluster_volumes"

cluster-up:
	oc cluster up \
	--host-config-dir=$(OC_CONFIG_DIR) \
	--host-data-dir=$(OC_DATA_DIR) \
	--host-pv-dir=$(OC_PV_DIR) \
	--host-volumes-dir=$(OC_VOLUMES_DIR) \
	--image-streams=$(OC_IMAGE_STREAMS) \
	--logging=$(OC_ENABLE_LOGGING) \
	--metrics=$(OC_ENABLE_METRICS) \
	--routing-suffix=$(OC_ROUTING_SUFFIX) \
	--service-catalog=$(OC_ENABLE_SERVICE_CATALOG) \
	--use-existing-config=$(OC_USE_EXISTING_CONFIG) \
	--version=$(OC_VERSION)

cluster-permissions:
	oc login -u system:admin
	oc adm policy add-cluster-role-to-group system:openshift:templateservicebroker-client system:unauthenticated system:authenticated && \
	oc adm policy add-cluster-role-to-user cluster-admin admin