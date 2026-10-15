resource "aws_db_subnet_group" "ecs_db_subnet_group" {
  name       = "ecs-db-subnet-group"
  subnet_ids = [var.data_subnet_1, var.data_subnet_2]
  tags = {
    Name = "db subnet group"
  }
}

resource "aws_db_instance" "default" {
  identifier           = "mydb-instance-ecs"
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  instance_class       = "db.t4g.micro"
  username             = var.db_username
  manage_master_user_password = true
  db_subnet_group_name = aws_db_subnet_group.ecs_db_subnet_group.name
  vpc_security_group_ids = [var.db_sg_id]
  skip_final_snapshot  = true
}
