FROM  azurecr/azure-cli
CMD az cloud register -n dogfood --endpoint-active-directory https://login.windows-ppe.net --endpoint-active-directory-graph-resource-id https://graph.ppe.windows.net/ --endpoint-active-directory-resource-id https://management.core.windows.net/ --endpoint-gallery https://current.gallery.azure-test.net/ --endpoint-management https://management.core.windows.net/ --endpoint-resource-manager https://api-dogfood.resources.windows-int.net/ --suffix-storage-endpoint core.test-cint.azure-test.net --suffix-acr-login-server-endpoint .azurecr-test.io
CMD az cloud set -n dogfood
