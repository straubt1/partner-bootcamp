#!/usr/bin/python
class FilterModule(object):
  exclude_vars = (
      'exclude_vars',
      'ansible_all_ipv4_addresses',
      'ansible_all_ipv6_addresses',
      'ansible_apparmor',
      'ansible_architecture',
      'ansible_bios_date',
      'ansible_bios_version',
      'ansible_check_mode',
      'ansible_cmdline',
      'ansible_date_time',
      'ansible_default_ipv4',
      'ansible_default_ipv6',
      'ansible_device_links',
      'ansible_devices',
      'ansible_diff_mode',
      'ansible_distribution',
      'ansible_distribution_file_parsed',
      'ansible_distribution_file_path',
      'ansible_distribution_file_variety',
      'ansible_distribution_major_version',
      'ansible_distribution_release',
      'ansible_distribution_version',
      'ansible_dns',
      'ansible_domain',
      'ansible_effective_group_id',
      'ansible_effective_user_id',
      'ansible_env',
      'ansible_eth0',
      'ansible_facts',
      'ansible_fips',
      'ansible_forks',
      'ansible_form_factor',
      'ansible_fqdn',
      'ansible_host',
      'ansible_hostname',
      'ansible_interfaces',
      'ansible_inventory_sources',
      'ansible_is_chroot',
      'ansible_iscsi_iqn',
      'ansible_kernel',
      'ansible_lo',
      'ansible_local',
      'ansible_lsb',
      'ansible_machine',
      'ansible_machine_id',
      'ansible_memfree_mb',
      'ansible_memory_mb',
      'ansible_memtotal_mb',
      'ansible_mounts',
      'ansible_nodename',
      'ansible_os_family',
      'ansible_pkg_mgr',
      'ansible_play_batch',
      'ansible_play_hosts',
      'ansible_play_hosts_all',
      'ansible_playbook_python',
      'ansible_processor',
      'ansible_processor_cores',
      'ansible_processor_count',
      'ansible_processor_threads_per_core',
      'ansible_processor_vcpus',
      'ansible_product_name',
      'ansible_product_serial',
      'ansible_product_uuid',
      'ansible_product_version',
      'ansible_python',
      'ansible_python_version',
      'ansible_real_group_id',
      'ansible_real_user_id',
      'ansible_run_tags',
      'ansible_selinux',
      'ansible_selinux_python_present',
      'ansible_service_mgr',
      'ansible_skip_tags',
      'ansible_ssh_common_args',
      'ansible_ssh_host_key_ecdsa_public',
      'ansible_ssh_host_key_ed25519_public',
      'ansible_ssh_host_key_rsa_public',
      'ansible_swapfree_mb',
      'ansible_swaptotal_mb',
      'ansible_system',
      'ansible_system_capabilities',
      'ansible_system_capabilities_enforced',
      'ansible_system_vendor',
      'ansible_uptime_seconds',
      'ansible_user_dir',
      'ansible_user_gecos',
      'ansible_user_gid',
      'ansible_user_id',
      'ansible_user_shell',
      'ansible_user_uid',
      'ansible_userspace_architecture',
      'ansible_userspace_bits',
      'ansible_verbosity',
      'ansible_version',
      'ansible_virtualization_role',
      'ansible_virtualization_type',
      'computer_name',
      'environment',
      'fqdn',
      'gather_subset',
      'group_names',
      'groups',
      'hostvars',
      'id',
      'image',
      'inventory_dir',
      'inventory_file',
      'inventory_hostname',
      'inventory_hostname_short',
      'location',
      'mac_address',
      'module_setup',
      'my_vars',
      'name',
      'network_interface',
      'network_interface_id',
      'omit',
      'os_disk',
      'plan',
      'play_hosts',
      'playbook_dir',
      'private_ip',
      'private_ip_alloc_method',
      'provisioning_state',
      'public_ip',
      'public_ip_alloc_method',
      'public_ip_id',
      'public_ip_name',
      'resource_group',
      'role_names',
      'tags',
      'type',
      'virtual_machine_size',
      'ansible_connection',
      'ansible_ip6tnl0',
      'ansible_python_interpreter',
      'ansible_tunl0',
    )
  def filters(self):
    return {
      'var_filter': self.var_filter,
    }

  def var_filter(self, all_vars):
    my_vars = dict(all_vars)
    for key in self.exclude_vars:
      if key in my_vars:
        my_vars.pop(key, None)

    return my_vars