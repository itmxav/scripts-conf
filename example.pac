function FindProxyForURL(url, host)
{
	if (isPlainHostName(host) || dnsDomainIs(host, ".example1.loc") || dnsDomainIs(host, ".example2.loc") || dnsDomainIs(host, "example1.loc") || dnsDomainIs(host, "example2.loc")) 
	{
		return "DIRECT";
	} else 
	{
	 return "PROXY IP_ADDR_PROXY:PORT_PROXY; DIRECT";
	}
}
