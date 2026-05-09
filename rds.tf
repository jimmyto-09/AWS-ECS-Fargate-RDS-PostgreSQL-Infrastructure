resource "aws_db_subnet_group" "db_subnet_group" {
  name = "proyecto7-db-subnet-group"

  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]

  tags = {
    Name = "proyecto7-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "proyecto7-postgres"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = "appdb"
  username               = "postgres"
  password               = "Password123456!"
  port                   = 5432
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = "proyecto7-postgres"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}