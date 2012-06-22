define activemq::instance::stomp::user(username, password, groups, target_instance) {

  $instance_xml = "${activemq::params::amq_instancedir}/${target_instance}/activemq.xml"
  $data => inline_template("              <authenticationUser username=\"<%= username %>\" password=\"<%= password %>\" groups=\"<%= groups.join(',') %>\"/>\n")

  concat::fragment { "${target_instance}-user-${name}":
    content => $data,
    order   => '250',
    target  => $instance_xml,
  }
}
