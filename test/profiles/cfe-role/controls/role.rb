# frozen_string_literal: true

# Validates that CFE custom role is present.

EXPECTED_PERMISSIONS = [
  'compute.forwardingRules.get',
  'compute.forwardingRules.list',
  'compute.forwardingRules.setTarget',
  'compute.instances.create',
  'compute.instances.get',
  'compute.instances.list',
  'compute.instances.updateNetworkInterface',
  'compute.networks.updatePolicy',
  'compute.routes.create',
  'compute.routes.delete',
  'compute.routes.get',
  'compute.routes.list',
  'compute.targetInstances.get',
  'compute.targetInstances.list',
  'compute.targetInstances.use',
  'storage.buckets.create',
  'storage.buckets.delete',
  'storage.buckets.get',
  'storage.buckets.list',
  'storage.buckets.update',
  'storage.objects.create',
  'storage.objects.delete',
  'storage.objects.get',
  'storage.objects.list',
  'storage.objects.update'
].freeze

control 'cfe_project_role' do
  title 'Verify BIG-IP CFE custom role with project scope'
  impact 1.0

  role_id = input('output_role_id')

  params = role_id.match(%r{^projects/(?<project>[^/]+)/roles/(?<name>.+)$}).named_captures
  role = google_project_iam_custom_role(project: params['project'], name: params['name'])
  describe role do
    it { should exist }
    its('included_permissions') { should cmp EXPECTED_PERMISSIONS }
  end
end

control 'cfe_org_role' do
  title 'Verify BIG-IP CFE custom role with org scope'
  impact 1.0

  role_id = input('output_role_id')

  params = role_id.match(%r{^organizations/(?<org>[^/]+)/roles/(?<name>.+)$}).named_captures
  role = google_iam_organization_custom_role(org_id: params['org'], name: params['name'])
  describe role do
    it { should exist }
    its('included_permissions') { should cmp EXPECTED_PERMISSIONS }
  end
end
