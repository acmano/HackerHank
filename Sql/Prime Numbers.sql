create function is_prime (@n int)
return boolean
as
begin
  if ( @n <= 1 )
    return (False)
  declare @i integer = @n 
  while ( @i <= cast(sqrt(@n)+1 as int))
  begin
    if (@n % @i = 0)
      return false
    @i = @i + 1
  end
  return true;
end
     