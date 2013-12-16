class mcollective::package inherits mcollective {

  package { 'mcollective-common':
    ensure  => $version,
  }
  ->
  package { 'mcollective':
    ensure  => $version,
  }
  ->
  package { 'mcollective-client':
    ensure  => $version,
  }

}
