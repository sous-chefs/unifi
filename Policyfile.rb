# frozen_string_literal: true

name 'unifi'
default_source :supermarket
run_list 'test::default'
cookbook 'unifi', path: '.'
cookbook 'test', path: './test/cookbooks/test'
named_run_list :default, 'test::default'
