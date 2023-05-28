// Region for all resource
param location string = resourceGroup().location

param name string = 'rg_eastus_85570_1_168525133780'

@secure()
param aadUsername string
@secure()
param aadSid string

// Variables
var hostingPlanName = '${name}${uniqueString(resourceGroup().id)}'
var webSiteName = '${name}${uniqueString(resourceGroup().id)}'

var sqlserverName = '${name}${uniqueString(resourceGroup().id)}'
var databaseName = 'sampledb'

var appGatewaySubnetName = 'AppGwSubnet'

var frontDoorName = '${name}${uniqueString(resourceGroup().id)}'

var frontEndEndpointName = frontDoorName
var routingRuleName = 'routingRule'
var origingGroupName = 'backendOrigingGroup'
var origingName = 'appSvcNetDemo'

resource hostingPlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: 'Free'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}
