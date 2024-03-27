#Create SHARED OU
resource "aws_organizations_organizational_unit" "Shared_Services_OU" {
  name      = "Shared_Services_OU"
  parent_id = var.root_ou_id
}

#Create GST OU
resource "aws_organizations_organizational_unit" "GST_OU" {
  name      = "GST_OU"
  parent_id = var.root_ou_id
}

#Create GFSF OU
resource "aws_organizations_organizational_unit" "GFSF_OU" {
  name      = "GFSF_OU"
  parent_id = var.root_ou_id
}

#Create USAL OU
resource "aws_organizations_organizational_unit" "USAL_OU" {
  name      = "USAL_OU"
  parent_id = var.root_ou_id
}


#Create Infrastructure_OU
resource "aws_organizations_organizational_unit" "Security_OU" {
  name      = "Security_OU"
  parent_id = aws_organizations_organizational_unit. Shared_Services_OU.id
}

#Create Infrastructure_OU
resource "aws_organizations_organizational_unit" "Connectivity_OU" {
  name      = "Conectivity_OU"
  parent_id = aws_organizations_organizational_unit. Shared_Services_OU.id
}

#create HR_OU
resource "aws_organizations_organizational_unit" "HR_OU" {
  name      = "HR_OU"
  parent_id = var.root_ou_id
}

#Create DEV_OU and PROD_OU with in HR_OU
resource "aws_organizations_organizational_unit" "HR_Dev_OU" {
  name      = "Dev_OU"  
  parent_id = aws_organizations_organizational_unit.HR_OU.id
  
}

resource "aws_organizations_account" "HR-dev-account1" {
  name       = "HR-Dev-Account1"    # Name of the AWS account
  email      = "mek9760+=@gmail.com"  
  parent_id  = aws_organizations_organizational_unit.HR_Dev_OU.id
  role_name  = "OrganizationAccountAccessRole"
}

resource "aws_organizations_organizational_unit" "HR_Prod_OU" {
  name      = "PRod_OU"   
  parent_id = aws_organizations_organizational_unit.HR_OU.id
}


#create Finance_OU
resource "aws_organizations_organizational_unit" "Finance_OU" {
  name      = "Finance_OU"
  parent_id = aws_organizations_organizational_unit. Shared_Services_OU.id
}

#Create DEV_OU and PROD_OU within Finance_OU
resource "aws_organizations_organizational_unit" "Finance_Dev_OU" {
  name      = "Dev_OU"   
  parent_id = aws_organizations_organizational_unit.Finance_OU.id
  
}

resource "aws_organizations_organizational_unit" "Finance_Prod_OU" {
  name      = "PRod_OU"   
  parent_id = aws_organizations_organizational_unit.Finance_OU.id
}

#create IT_OU
resource "aws_organizations_organizational_unit" "IT_OU" {
  name      = "IT_OU"
  parent_id = aws_organizations_organizational_unit. Shared_Services_OU.id
}

#Create DEV_OU and PROD_OU within IT_OU
resource "aws_organizations_organizational_unit" "IT_Dev_OU" {
  name      = "Dev_OU"   
  parent_id = aws_organizations_organizational_unit.IT_OU.id
  
}

resource "aws_organizations_organizational_unit" "IT_Prod_OU" {
  name      = "PRod_OU"   
  parent_id = aws_organizations_organizational_unit.IT_OU.id
}

#create GSPS_OU
resource "aws_organizations_organizational_unit" "GSPS_OU" {
  name      = "GSPS_OU"
  parent_id = aws_organizations_organizational_unit. Shared_Services_OU.id
}

#Create DEV_OU, TEST_OU,  and PROD_OU with in GSPS_OU
resource "aws_organizations_organizational_unit" "GSPS_Dev_OU" {
  name      = "Dev_OU"   
  parent_id = aws_organizations_organizational_unit.GSPS_OU.id
  
}

resource "aws_organizations_organizational_unit" "GSPS_Prod_OU" {
  name      = "PRod_OU"   
  parent_id = aws_organizations_organizational_unit.GSPS_OU.id
}

resource "aws_organizations_organizational_unit" "GSPS_TEST_OU" {
  name      = "TEST_OU"   
  parent_id = aws_organizations_organizational_unit.GSPS_OU.id
}

#create Sandbox_OU
resource "aws_organizations_organizational_unit" "Sandbox_OU" {
  name      = "Sandobx_OU"
  parent_id = aws_organizations_organizational_unit. Shared_Services_OU.id
}

