# Configure subaccount entitlement, add free services
resource "btp_subaccount_entitlement" "abap" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "abap"
  plan_name     = "free"
  amount = 1
}

resource "btp_subaccount_entitlement" "alert-notification" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "alert-notification"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "auditlog-viewer" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "auditlog-viewer"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "business-entity-recognition" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "business-entity-recognition"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "cloudfoundry" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "cloudfoundry"
  plan_name     = "free"
  amount        = 1   
}

resource "btp_subaccount_entitlement" "alm-ts" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "alm-ts"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "content-agent-ui" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "content-agent-ui"
  plan_name     = "free"
}

/* resource "btp_subaccount_entitlement" "cicd-app" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "cicd-app"
  plan_name     = "free"
  amount = 1
} */

resource "btp_subaccount_entitlement" "credstore" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "credstore"
  plan_name     = "free"
  amount = 1
}

/* resource "btp_subaccount_entitlement" "data-attribute-recommendation" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "data-attribute-recommendation"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "data-privacy-integration-service" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "data-privacy-integration-service"
  plan_name     = "free"
  amount = 1
}

/* resource "btp_subaccount_entitlement" "dq-services" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "dq-services"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "retention-manager" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "retention-manager"
  plan_name     = "free"
  amount = 1
}

resource "btp_subaccount_entitlement" "sap-document-information-extraction" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sap-document-information-extraction"
  plan_name     = "free"
  amount = 1
}

resource "btp_subaccount_entitlement" "sdm" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sdm"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "sdm-repository" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sdm-repository"
  plan_name     = "free"
}

/* resource "btp_subaccount_entitlement" "document-translation" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "document-translation"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "integrationsuite" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "integrationsuite"
  plan_name     = "free"
  amount = 1
}

/* resource "btp_subaccount_entitlement" "intelligent-situation-automation-app" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "intelligent-situation-automation-app"
  plan_name     = "free"
  amount = 1
} */

/* resource "btp_subaccount_entitlement" "kymaruntime" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "kymaruntime"
  plan_name     = "free"
  amount = 1
} */

/* resource "btp_subaccount_entitlement" "market-rates-byor" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "market-rates-byor"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "mobile-services" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "mobile-services"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "personal-data-manager-service" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "personal-data-manager-service"
  plan_name     = "free"
  amount = 1
}

/* resource "btp_subaccount_entitlement" "recommendation-systems-production" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "recommendation-systems-production"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "aicore" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "aicore"
  plan_name     = "free"
  amount = 1
}

resource "btp_subaccount_entitlement" "ai-launchpad" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "ai-launchpad"
  plan_name     = "free"
  amount = 1
}

/* resource "btp_subaccount_entitlement" "sap-build-apps" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sap-build-apps"
  plan_name     = "free"
  amount = 1
} */

resource "btp_subaccount_entitlement" "process-automation" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "process-automation"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "build-workzone-standard" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "SAPLaunchpad"   #"build-workzone-standard"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "sapappstudio" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sapappstudio"
  plan_name     = "free"
  amount = 1
}

resource "btp_subaccount_entitlement" "data-analytics-osb" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "data-analytics-osb"
  plan_name     = "free"
}

/* resource "btp_subaccount_entitlement" "sap-graph" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "sap-graph"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "hana-cloud" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "hana-cloud"
  plan_name     = "hana-free"
}

/* resource "btp_subaccount_entitlement" "mdgce" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "mdgce"
  plan_name     = "free"
  amount = 1
} */

/* resource "btp_subaccount_entitlement" "service-ticket-intelligence" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "service-ticket-intelligence"
  plan_name     = "free"
} */

resource "btp_subaccount_entitlement" "ui5-flexibility-keyuser" {
  subaccount_id = btp_subaccount.dev.id
  service_name  = "ui5-flexibility-keyuser"
  plan_name     = "free"
}
