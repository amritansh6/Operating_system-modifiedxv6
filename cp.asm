
_cp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void ls(char *path);
char* fmtname(char *path);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
	if (argc !=3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)
{
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
	if (argc !=3)
  1d:	74 13                	je     32 <main+0x32>
	{
		printf(1, "please input the command as [cp src_file dest_file]\n");
  1f:	50                   	push   %eax
  20:	50                   	push   %eax
  21:	68 18 0c 00 00       	push   $0xc18
  26:	6a 01                	push   $0x1
  28:	e8 e3 07 00 00       	call   810 <printf>
		exit();
  2d:	e8 80 06 00 00       	call   6b2 <exit>
	}
	
	int fd_src = open(argv[1], O_RDONLY);
  32:	50                   	push   %eax
  33:	50                   	push   %eax
  34:	6a 00                	push   $0x0
  36:	ff 73 04             	pushl  0x4(%ebx)
  39:	e8 b4 06 00 00       	call   6f2 <open>
	if (fd_src == -1)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	83 f8 ff             	cmp    $0xffffffff,%eax
	int fd_src = open(argv[1], O_RDONLY);
  44:	89 c6                	mov    %eax,%esi
	if (fd_src == -1)
  46:	0f 84 1f 01 00 00    	je     16b <main+0x16b>
		printf(1, "open source file failed\n");
		exit();
	}
	
	struct stat st;
	fstat(fd_src, &st);
  4c:	8d 85 54 fe ff ff    	lea    -0x1ac(%ebp),%eax
  52:	57                   	push   %edi
  53:	57                   	push   %edi
  54:	50                   	push   %eax
  55:	56                   	push   %esi
  56:	e8 af 06 00 00       	call   70a <fstat>
	if (st.type == T_DIR)
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	66 83 bd 54 fe ff ff 	cmpw   $0x1,-0x1ac(%ebp)
  65:	01 
  66:	0f 84 c7 00 00 00    	je     133 <main+0x133>
		ls(argv[1]);
		printf(1, "the program can't open the file in that directory after list them.\n");
		printf(1, "So, I'm sorry that you have to copy them one by one.\n");
		exit();
	}
	char com[128] = {};
  6c:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  72:	31 c0                	xor    %eax,%eax
  74:	b9 20 00 00 00       	mov    $0x20,%ecx
  79:	f3 ab                	rep stos %eax,%es:(%edi)
	strcpy(com, argv[2]);
  7b:	57                   	push   %edi
  7c:	57                   	push   %edi
  7d:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  83:	ff 73 08             	pushl  0x8(%ebx)
  86:	57                   	push   %edi
  87:	e8 d4 03 00 00       	call   460 <strcpy>
	int len1 = strlen(argv[1]);
  8c:	58                   	pop    %eax
  8d:	ff 73 04             	pushl  0x4(%ebx)
  90:	e8 4b 04 00 00       	call   4e0 <strlen>
  95:	89 85 44 fe ff ff    	mov    %eax,-0x1bc(%ebp)
	int len2 = strlen(argv[2]);
  9b:	58                   	pop    %eax
  9c:	ff 73 08             	pushl  0x8(%ebx)
  9f:	e8 3c 04 00 00       	call   4e0 <strlen>
	if (argv[2][len2-1] == '/')
  a4:	8b 53 08             	mov    0x8(%ebx),%edx
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	80 7c 02 ff 2f       	cmpb   $0x2f,-0x1(%edx,%eax,1)
  af:	0f 84 c9 00 00 00    	je     17e <main+0x17e>
			if (argv[1][i] == '/')
				break;
		i++;
		strcpy(&com[len2], &argv[1][i]);
	}
	int fd_dest = open(com, O_WRONLY|O_CREATE);
  b5:	51                   	push   %ecx
  b6:	51                   	push   %ecx
  b7:	68 01 02 00 00       	push   $0x201
  bc:	57                   	push   %edi
  bd:	e8 30 06 00 00       	call   6f2 <open>
	if (fd_dest == -1)
  c2:	83 c4 10             	add    $0x10,%esp
	int fd_dest = open(com, O_WRONLY|O_CREATE);
  c5:	89 85 44 fe ff ff    	mov    %eax,-0x1bc(%ebp)
	if (fd_dest == -1)
  cb:	83 c0 01             	add    $0x1,%eax
  ce:	0f 84 dc 00 00 00    	je     1b0 <main+0x1b0>
	{
		printf(1, "create dest file failed\n");
		exit();
	}
	
	char buf[BUF_SIZE] = {};
  d4:	8d 9d e8 fe ff ff    	lea    -0x118(%ebp),%ebx
  da:	b9 40 00 00 00       	mov    $0x40,%ecx
  df:	31 c0                	xor    %eax,%eax
  e1:	89 df                	mov    %ebx,%edi
  e3:	f3 ab                	rep stos %eax,%es:(%edi)
	int len = 0;
	while((len = read(fd_src, buf, BUF_SIZE)) > 0)
  e5:	eb 1c                	jmp    103 <main+0x103>
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		write(fd_dest, buf, len);
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	50                   	push   %eax
  f4:	53                   	push   %ebx
  f5:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
  fb:	e8 d2 05 00 00       	call   6d2 <write>
 100:	83 c4 10             	add    $0x10,%esp
	while((len = read(fd_src, buf, BUF_SIZE)) > 0)
 103:	83 ec 04             	sub    $0x4,%esp
 106:	68 00 01 00 00       	push   $0x100
 10b:	53                   	push   %ebx
 10c:	56                   	push   %esi
 10d:	e8 b8 05 00 00       	call   6ca <read>
 112:	83 c4 10             	add    $0x10,%esp
 115:	85 c0                	test   %eax,%eax
 117:	7f d7                	jg     f0 <main+0xf0>
	
	close(fd_src);
 119:	83 ec 0c             	sub    $0xc,%esp
 11c:	56                   	push   %esi
 11d:	e8 b8 05 00 00       	call   6da <close>
	close(fd_dest);
 122:	58                   	pop    %eax
 123:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
 129:	e8 ac 05 00 00       	call   6da <close>
	exit();
 12e:	e8 7f 05 00 00       	call   6b2 <exit>
		printf(1, "source file is a directory, the files in that directory is:\n");
 133:	50                   	push   %eax
 134:	50                   	push   %eax
 135:	68 50 0c 00 00       	push   $0xc50
 13a:	6a 01                	push   $0x1
 13c:	e8 cf 06 00 00       	call   810 <printf>
		ls(argv[1]);
 141:	58                   	pop    %eax
 142:	ff 73 04             	pushl  0x4(%ebx)
 145:	e8 26 01 00 00       	call   270 <ls>
		printf(1, "the program can't open the file in that directory after list them.\n");
 14a:	58                   	pop    %eax
 14b:	5a                   	pop    %edx
 14c:	68 90 0c 00 00       	push   $0xc90
 151:	6a 01                	push   $0x1
 153:	e8 b8 06 00 00       	call   810 <printf>
		printf(1, "So, I'm sorry that you have to copy them one by one.\n");
 158:	59                   	pop    %ecx
 159:	5b                   	pop    %ebx
 15a:	68 d4 0c 00 00       	push   $0xcd4
 15f:	6a 01                	push   $0x1
 161:	e8 aa 06 00 00       	call   810 <printf>
		exit();
 166:	e8 47 05 00 00       	call   6b2 <exit>
		printf(1, "open source file failed\n");
 16b:	50                   	push   %eax
 16c:	50                   	push   %eax
 16d:	68 97 0b 00 00       	push   $0xb97
 172:	6a 01                	push   $0x1
 174:	e8 97 06 00 00       	call   810 <printf>
		exit();
 179:	e8 34 05 00 00       	call   6b2 <exit>
		int i = len1 - 1;
 17e:	8b 95 44 fe ff ff    	mov    -0x1bc(%ebp),%edx
 184:	8b 5b 04             	mov    0x4(%ebx),%ebx
 187:	83 ea 01             	sub    $0x1,%edx
		for (; i >= 0; i--)
 18a:	eb 09                	jmp    195 <main+0x195>
			if (argv[1][i] == '/')
 18c:	80 3c 13 2f          	cmpb   $0x2f,(%ebx,%edx,1)
 190:	74 07                	je     199 <main+0x199>
		for (; i >= 0; i--)
 192:	83 ea 01             	sub    $0x1,%edx
 195:	85 d2                	test   %edx,%edx
 197:	79 f3                	jns    18c <main+0x18c>
		strcpy(&com[len2], &argv[1][i]);
 199:	8d 54 13 01          	lea    0x1(%ebx,%edx,1),%edx
 19d:	01 f8                	add    %edi,%eax
 19f:	51                   	push   %ecx
 1a0:	51                   	push   %ecx
 1a1:	52                   	push   %edx
 1a2:	50                   	push   %eax
 1a3:	e8 b8 02 00 00       	call   460 <strcpy>
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	e9 05 ff ff ff       	jmp    b5 <main+0xb5>
		printf(1, "create dest file failed\n");
 1b0:	52                   	push   %edx
 1b1:	52                   	push   %edx
 1b2:	68 b0 0b 00 00       	push   $0xbb0
 1b7:	6a 01                	push   $0x1
 1b9:	e8 52 06 00 00       	call   810 <printf>
		exit();
 1be:	e8 ef 04 00 00       	call   6b2 <exit>
 1c3:	66 90                	xchg   %ax,%ax
 1c5:	66 90                	xchg   %ax,%ax
 1c7:	66 90                	xchg   %ax,%ax
 1c9:	66 90                	xchg   %ax,%ax
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <fmtname>:
}

char* fmtname(char *path)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
	static char buf[DIRSIZ+1];
	char *p;
	
	// Find first character after last slash.
	for(p=path+strlen(path); p >= path && *p != '/'; p--)
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 ff 02 00 00       	call   4e0 <strlen>
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	01 d8                	add    %ebx,%eax
 1e6:	73 0f                	jae    1f7 <fmtname+0x27>
 1e8:	eb 12                	jmp    1fc <fmtname+0x2c>
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f0:	83 e8 01             	sub    $0x1,%eax
 1f3:	39 c3                	cmp    %eax,%ebx
 1f5:	77 05                	ja     1fc <fmtname+0x2c>
 1f7:	80 38 2f             	cmpb   $0x2f,(%eax)
 1fa:	75 f4                	jne    1f0 <fmtname+0x20>
		;
	p++;
 1fc:	8d 58 01             	lea    0x1(%eax),%ebx
	
	// Return blank-padded name.
	if(strlen(p) >= DIRSIZ)
 1ff:	83 ec 0c             	sub    $0xc,%esp
 202:	53                   	push   %ebx
 203:	e8 d8 02 00 00       	call   4e0 <strlen>
 208:	83 c4 10             	add    $0x10,%esp
 20b:	83 f8 0d             	cmp    $0xd,%eax
 20e:	77 4a                	ja     25a <fmtname+0x8a>
		return p;
	memmove(buf, p, strlen(p));
 210:	83 ec 0c             	sub    $0xc,%esp
 213:	53                   	push   %ebx
 214:	e8 c7 02 00 00       	call   4e0 <strlen>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	50                   	push   %eax
 21d:	53                   	push   %ebx
 21e:	68 38 10 00 00       	push   $0x1038
 223:	e8 58 04 00 00       	call   680 <memmove>
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 228:	89 1c 24             	mov    %ebx,(%esp)
 22b:	e8 b0 02 00 00       	call   4e0 <strlen>
 230:	89 1c 24             	mov    %ebx,(%esp)
 233:	89 c6                	mov    %eax,%esi
	return buf;
 235:	bb 38 10 00 00       	mov    $0x1038,%ebx
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 23a:	e8 a1 02 00 00       	call   4e0 <strlen>
 23f:	ba 0e 00 00 00       	mov    $0xe,%edx
 244:	83 c4 0c             	add    $0xc,%esp
 247:	05 38 10 00 00       	add    $0x1038,%eax
 24c:	29 f2                	sub    %esi,%edx
 24e:	52                   	push   %edx
 24f:	6a 20                	push   $0x20
 251:	50                   	push   %eax
 252:	e8 b9 02 00 00       	call   510 <memset>
	return buf;
 257:	83 c4 10             	add    $0x10,%esp
}
 25a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25d:	89 d8                	mov    %ebx,%eax
 25f:	5b                   	pop    %ebx
 260:	5e                   	pop    %esi
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <ls>:

void ls(char *path)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 54 02 00 00    	sub    $0x254,%esp
 27c:	8b 7d 08             	mov    0x8(%ebp),%edi
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
 27f:	6a 00                	push   $0x0
 281:	57                   	push   %edi
 282:	e8 6b 04 00 00       	call   6f2 <open>
 287:	83 c4 10             	add    $0x10,%esp
 28a:	85 c0                	test   %eax,%eax
 28c:	78 4a                	js     2d8 <ls+0x68>
	{
		printf(2, "cannot open %s\n", path);
		return;
	}
	
	if(fstat(fd, &st) < 0)
 28e:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 294:	83 ec 08             	sub    $0x8,%esp
 297:	89 c3                	mov    %eax,%ebx
 299:	56                   	push   %esi
 29a:	50                   	push   %eax
 29b:	e8 6a 04 00 00       	call   70a <fstat>
 2a0:	83 c4 10             	add    $0x10,%esp
 2a3:	85 c0                	test   %eax,%eax
 2a5:	0f 88 a5 00 00 00    	js     350 <ls+0xe0>
		printf(2, "cannot stat %s\n", path);
		close(fd);
		return;
	}
	
	switch(st.type)
 2ab:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 2b2:	66 83 f8 01          	cmp    $0x1,%ax
 2b6:	74 68                	je     320 <ls+0xb0>
 2b8:	66 83 f8 02          	cmp    $0x2,%ax
 2bc:	74 3a                	je     2f8 <ls+0x88>
			}
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
		}
		break;
	}
	close(fd);
 2be:	83 ec 0c             	sub    $0xc,%esp
 2c1:	53                   	push   %ebx
 2c2:	e8 13 04 00 00       	call   6da <close>
 2c7:	83 c4 10             	add    $0x10,%esp
}
 2ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5f                   	pop    %edi
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		printf(2, "cannot open %s\n", path);
 2d8:	83 ec 04             	sub    $0x4,%esp
 2db:	57                   	push   %edi
 2dc:	68 68 0b 00 00       	push   $0xb68
 2e1:	6a 02                	push   $0x2
 2e3:	e8 28 05 00 00       	call   810 <printf>
		return;
 2e8:	83 c4 10             	add    $0x10,%esp
}
 2eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ee:	5b                   	pop    %ebx
 2ef:	5e                   	pop    %esi
 2f0:	5f                   	pop    %edi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	90                   	nop
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		printf(1, "name = %s, type = file, size = %d\n", fmtname(path), st.size);
 2f8:	83 ec 0c             	sub    $0xc,%esp
 2fb:	8b b5 e4 fd ff ff    	mov    -0x21c(%ebp),%esi
 301:	57                   	push   %edi
 302:	e8 c9 fe ff ff       	call   1d0 <fmtname>
 307:	56                   	push   %esi
 308:	50                   	push   %eax
 309:	68 cc 0b 00 00       	push   $0xbcc
 30e:	6a 01                	push   $0x1
 310:	e8 fb 04 00 00       	call   810 <printf>
		break;
 315:	83 c4 20             	add    $0x20,%esp
 318:	eb a4                	jmp    2be <ls+0x4e>
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
 320:	83 ec 0c             	sub    $0xc,%esp
 323:	57                   	push   %edi
 324:	e8 b7 01 00 00       	call   4e0 <strlen>
 329:	83 c0 10             	add    $0x10,%eax
 32c:	83 c4 10             	add    $0x10,%esp
 32f:	3d 00 02 00 00       	cmp    $0x200,%eax
 334:	76 42                	jbe    378 <ls+0x108>
			printf(1, "path too long\n");
 336:	83 ec 08             	sub    $0x8,%esp
 339:	68 88 0b 00 00       	push   $0xb88
 33e:	6a 01                	push   $0x1
 340:	e8 cb 04 00 00       	call   810 <printf>
			break;
 345:	83 c4 10             	add    $0x10,%esp
 348:	e9 71 ff ff ff       	jmp    2be <ls+0x4e>
 34d:	8d 76 00             	lea    0x0(%esi),%esi
		printf(2, "cannot stat %s\n", path);
 350:	83 ec 04             	sub    $0x4,%esp
 353:	57                   	push   %edi
 354:	68 78 0b 00 00       	push   $0xb78
 359:	6a 02                	push   $0x2
 35b:	e8 b0 04 00 00       	call   810 <printf>
		close(fd);
 360:	89 1c 24             	mov    %ebx,(%esp)
 363:	e8 72 03 00 00       	call   6da <close>
		return;
 368:	83 c4 10             	add    $0x10,%esp
}
 36b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	90                   	nop
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		strcpy(buf, path);
 378:	83 ec 08             	sub    $0x8,%esp
 37b:	57                   	push   %edi
 37c:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 382:	57                   	push   %edi
 383:	e8 d8 00 00 00       	call   460 <strcpy>
		p = buf+strlen(buf);
 388:	89 3c 24             	mov    %edi,(%esp)
 38b:	e8 50 01 00 00       	call   4e0 <strlen>
 390:	01 f8                	add    %edi,%eax
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 392:	83 c4 10             	add    $0x10,%esp
		*p++ = '/';
 395:	8d 48 01             	lea    0x1(%eax),%ecx
		p = buf+strlen(buf);
 398:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%ebp)
		*p++ = '/';
 39e:	c6 00 2f             	movb   $0x2f,(%eax)
 3a1:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 3b0:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 3b6:	83 ec 04             	sub    $0x4,%esp
 3b9:	6a 10                	push   $0x10
 3bb:	50                   	push   %eax
 3bc:	53                   	push   %ebx
 3bd:	e8 08 03 00 00       	call   6ca <read>
 3c2:	83 c4 10             	add    $0x10,%esp
 3c5:	83 f8 10             	cmp    $0x10,%eax
 3c8:	0f 85 f0 fe ff ff    	jne    2be <ls+0x4e>
			if(de.inum == 0)
 3ce:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 3d5:	00 
 3d6:	74 d8                	je     3b0 <ls+0x140>
			memmove(p, de.name, DIRSIZ);
 3d8:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 3de:	83 ec 04             	sub    $0x4,%esp
 3e1:	6a 0e                	push   $0xe
 3e3:	50                   	push   %eax
 3e4:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
 3ea:	e8 91 02 00 00       	call   680 <memmove>
			p[DIRSIZ] = 0;
 3ef:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
 3f5:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
			if(stat(buf, &st) < 0)
 3f9:	58                   	pop    %eax
 3fa:	5a                   	pop    %edx
 3fb:	56                   	push   %esi
 3fc:	57                   	push   %edi
 3fd:	e8 ee 01 00 00       	call   5f0 <stat>
 402:	83 c4 10             	add    $0x10,%esp
 405:	85 c0                	test   %eax,%eax
 407:	78 37                	js     440 <ls+0x1d0>
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
 409:	83 ec 0c             	sub    $0xc,%esp
 40c:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 412:	57                   	push   %edi
 413:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 419:	e8 b2 fd ff ff       	call   1d0 <fmtname>
 41e:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 424:	52                   	push   %edx
 425:	50                   	push   %eax
 426:	68 f0 0b 00 00       	push   $0xbf0
 42b:	6a 01                	push   $0x1
 42d:	e8 de 03 00 00       	call   810 <printf>
 432:	83 c4 20             	add    $0x20,%esp
 435:	e9 76 ff ff ff       	jmp    3b0 <ls+0x140>
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
				printf(1, "cannot stat %s\n", buf);
 440:	83 ec 04             	sub    $0x4,%esp
 443:	57                   	push   %edi
 444:	68 78 0b 00 00       	push   $0xb78
 449:	6a 01                	push   $0x1
 44b:	e8 c0 03 00 00       	call   810 <printf>
				continue;
 450:	83 c4 10             	add    $0x10,%esp
 453:	e9 58 ff ff ff       	jmp    3b0 <ls+0x140>
 458:	66 90                	xchg   %ax,%ax
 45a:	66 90                	xchg   %ax,%ax
 45c:	66 90                	xchg   %ax,%ax
 45e:	66 90                	xchg   %ax,%ax

00000460 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	53                   	push   %ebx
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 46a:	89 c2                	mov    %eax,%edx
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 470:	83 c1 01             	add    $0x1,%ecx
 473:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 477:	83 c2 01             	add    $0x1,%edx
 47a:	84 db                	test   %bl,%bl
 47c:	88 5a ff             	mov    %bl,-0x1(%edx)
 47f:	75 ef                	jne    470 <strcpy+0x10>
    ;
  return os;
}
 481:	5b                   	pop    %ebx
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 48a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000490 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
 494:	8b 55 08             	mov    0x8(%ebp),%edx
 497:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 49a:	0f b6 02             	movzbl (%edx),%eax
 49d:	0f b6 19             	movzbl (%ecx),%ebx
 4a0:	84 c0                	test   %al,%al
 4a2:	75 1c                	jne    4c0 <strcmp+0x30>
 4a4:	eb 2a                	jmp    4d0 <strcmp+0x40>
 4a6:	8d 76 00             	lea    0x0(%esi),%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 4b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 4b6:	83 c1 01             	add    $0x1,%ecx
 4b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 4bc:	84 c0                	test   %al,%al
 4be:	74 10                	je     4d0 <strcmp+0x40>
 4c0:	38 d8                	cmp    %bl,%al
 4c2:	74 ec                	je     4b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 4c4:	29 d8                	sub    %ebx,%eax
}
 4c6:	5b                   	pop    %ebx
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 4d2:	29 d8                	sub    %ebx,%eax
}
 4d4:	5b                   	pop    %ebx
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret    
 4d7:	89 f6                	mov    %esi,%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <strlen>:

uint
strlen(char *s)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4e6:	80 39 00             	cmpb   $0x0,(%ecx)
 4e9:	74 15                	je     500 <strlen+0x20>
 4eb:	31 d2                	xor    %edx,%edx
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	83 c2 01             	add    $0x1,%edx
 4f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 4f7:	89 d0                	mov    %edx,%eax
 4f9:	75 f5                	jne    4f0 <strlen+0x10>
    ;
  return n;
}
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 500:	31 c0                	xor    %eax,%eax
}
 502:	5d                   	pop    %ebp
 503:	c3                   	ret    
 504:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 50a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000510 <memset>:

void*
memset(void *dst, int c, uint n)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 517:	8b 4d 10             	mov    0x10(%ebp),%ecx
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	89 d7                	mov    %edx,%edi
 51f:	fc                   	cld    
 520:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 522:	89 d0                	mov    %edx,%eax
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    
 527:	89 f6                	mov    %esi,%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000530 <strchr>:

char*
strchr(const char *s, char c)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 53a:	0f b6 10             	movzbl (%eax),%edx
 53d:	84 d2                	test   %dl,%dl
 53f:	74 1d                	je     55e <strchr+0x2e>
    if(*s == c)
 541:	38 d3                	cmp    %dl,%bl
 543:	89 d9                	mov    %ebx,%ecx
 545:	75 0d                	jne    554 <strchr+0x24>
 547:	eb 17                	jmp    560 <strchr+0x30>
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 550:	38 ca                	cmp    %cl,%dl
 552:	74 0c                	je     560 <strchr+0x30>
  for(; *s; s++)
 554:	83 c0 01             	add    $0x1,%eax
 557:	0f b6 10             	movzbl (%eax),%edx
 55a:	84 d2                	test   %dl,%dl
 55c:	75 f2                	jne    550 <strchr+0x20>
      return (char*)s;
  return 0;
 55e:	31 c0                	xor    %eax,%eax
}
 560:	5b                   	pop    %ebx
 561:	5d                   	pop    %ebp
 562:	c3                   	ret    
 563:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000570 <gets>:

char*
gets(char *buf, int max)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 576:	31 f6                	xor    %esi,%esi
 578:	89 f3                	mov    %esi,%ebx
{
 57a:	83 ec 1c             	sub    $0x1c,%esp
 57d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 580:	eb 2f                	jmp    5b1 <gets+0x41>
 582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 588:	8d 45 e7             	lea    -0x19(%ebp),%eax
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	6a 01                	push   $0x1
 590:	50                   	push   %eax
 591:	6a 00                	push   $0x0
 593:	e8 32 01 00 00       	call   6ca <read>
    if(cc < 1)
 598:	83 c4 10             	add    $0x10,%esp
 59b:	85 c0                	test   %eax,%eax
 59d:	7e 1c                	jle    5bb <gets+0x4b>
      break;
    buf[i++] = c;
 59f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5a3:	83 c7 01             	add    $0x1,%edi
 5a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 5a9:	3c 0a                	cmp    $0xa,%al
 5ab:	74 23                	je     5d0 <gets+0x60>
 5ad:	3c 0d                	cmp    $0xd,%al
 5af:	74 1f                	je     5d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 5b1:	83 c3 01             	add    $0x1,%ebx
 5b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5b7:	89 fe                	mov    %edi,%esi
 5b9:	7c cd                	jl     588 <gets+0x18>
 5bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 5c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 5c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c6:	5b                   	pop    %ebx
 5c7:	5e                   	pop    %esi
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret    
 5cb:	90                   	nop
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d0:	8b 75 08             	mov    0x8(%ebp),%esi
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	01 de                	add    %ebx,%esi
 5d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 5da:	c6 03 00             	movb   $0x0,(%ebx)
}
 5dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e0:	5b                   	pop    %ebx
 5e1:	5e                   	pop    %esi
 5e2:	5f                   	pop    %edi
 5e3:	5d                   	pop    %ebp
 5e4:	c3                   	ret    
 5e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005f0 <stat>:

int
stat(char *n, struct stat *st)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	56                   	push   %esi
 5f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5f5:	83 ec 08             	sub    $0x8,%esp
 5f8:	6a 00                	push   $0x0
 5fa:	ff 75 08             	pushl  0x8(%ebp)
 5fd:	e8 f0 00 00 00       	call   6f2 <open>
  if(fd < 0)
 602:	83 c4 10             	add    $0x10,%esp
 605:	85 c0                	test   %eax,%eax
 607:	78 27                	js     630 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 609:	83 ec 08             	sub    $0x8,%esp
 60c:	ff 75 0c             	pushl  0xc(%ebp)
 60f:	89 c3                	mov    %eax,%ebx
 611:	50                   	push   %eax
 612:	e8 f3 00 00 00       	call   70a <fstat>
  close(fd);
 617:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 61a:	89 c6                	mov    %eax,%esi
  close(fd);
 61c:	e8 b9 00 00 00       	call   6da <close>
  return r;
 621:	83 c4 10             	add    $0x10,%esp
}
 624:	8d 65 f8             	lea    -0x8(%ebp),%esp
 627:	89 f0                	mov    %esi,%eax
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    
 62d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 630:	be ff ff ff ff       	mov    $0xffffffff,%esi
 635:	eb ed                	jmp    624 <stat+0x34>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <atoi>:

int
atoi(const char *s)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 647:	0f be 11             	movsbl (%ecx),%edx
 64a:	8d 42 d0             	lea    -0x30(%edx),%eax
 64d:	3c 09                	cmp    $0x9,%al
  n = 0;
 64f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 654:	77 1f                	ja     675 <atoi+0x35>
 656:	8d 76 00             	lea    0x0(%esi),%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 660:	8d 04 80             	lea    (%eax,%eax,4),%eax
 663:	83 c1 01             	add    $0x1,%ecx
 666:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 66a:	0f be 11             	movsbl (%ecx),%edx
 66d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 670:	80 fb 09             	cmp    $0x9,%bl
 673:	76 eb                	jbe    660 <atoi+0x20>
  return n;
}
 675:	5b                   	pop    %ebx
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	90                   	nop
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000680 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	56                   	push   %esi
 684:	53                   	push   %ebx
 685:	8b 5d 10             	mov    0x10(%ebp),%ebx
 688:	8b 45 08             	mov    0x8(%ebp),%eax
 68b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 68e:	85 db                	test   %ebx,%ebx
 690:	7e 14                	jle    6a6 <memmove+0x26>
 692:	31 d2                	xor    %edx,%edx
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 698:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 69c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 69f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 6a2:	39 d3                	cmp    %edx,%ebx
 6a4:	75 f2                	jne    698 <memmove+0x18>
  return vdst;
}
 6a6:	5b                   	pop    %ebx
 6a7:	5e                   	pop    %esi
 6a8:	5d                   	pop    %ebp
 6a9:	c3                   	ret    

000006aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6aa:	b8 01 00 00 00       	mov    $0x1,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <exit>:
SYSCALL(exit)
 6b2:	b8 02 00 00 00       	mov    $0x2,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <wait>:
SYSCALL(wait)
 6ba:	b8 03 00 00 00       	mov    $0x3,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <pipe>:
SYSCALL(pipe)
 6c2:	b8 04 00 00 00       	mov    $0x4,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <read>:
SYSCALL(read)
 6ca:	b8 05 00 00 00       	mov    $0x5,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <write>:
SYSCALL(write)
 6d2:	b8 10 00 00 00       	mov    $0x10,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <close>:
SYSCALL(close)
 6da:	b8 15 00 00 00       	mov    $0x15,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <kill>:
SYSCALL(kill)
 6e2:	b8 06 00 00 00       	mov    $0x6,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <exec>:
SYSCALL(exec)
 6ea:	b8 07 00 00 00       	mov    $0x7,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <open>:
SYSCALL(open)
 6f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <mknod>:
SYSCALL(mknod)
 6fa:	b8 11 00 00 00       	mov    $0x11,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <unlink>:
SYSCALL(unlink)
 702:	b8 12 00 00 00       	mov    $0x12,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <fstat>:
SYSCALL(fstat)
 70a:	b8 08 00 00 00       	mov    $0x8,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <link>:
SYSCALL(link)
 712:	b8 13 00 00 00       	mov    $0x13,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <mkdir>:
SYSCALL(mkdir)
 71a:	b8 14 00 00 00       	mov    $0x14,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <chdir>:
SYSCALL(chdir)
 722:	b8 09 00 00 00       	mov    $0x9,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <dup>:
SYSCALL(dup)
 72a:	b8 0a 00 00 00       	mov    $0xa,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <getpid>:
SYSCALL(getpid)
 732:	b8 0b 00 00 00       	mov    $0xb,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <sbrk>:
SYSCALL(sbrk)
 73a:	b8 0c 00 00 00       	mov    $0xc,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <sleep>:
SYSCALL(sleep)
 742:	b8 0d 00 00 00       	mov    $0xd,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <uptime>:
SYSCALL(uptime)
 74a:	b8 0e 00 00 00       	mov    $0xe,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <date>:
SYSCALL(date)
 752:	b8 16 00 00 00       	mov    $0x16,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <getcwd>:
SYSCALL(getcwd)
 75a:	b8 17 00 00 00       	mov    $0x17,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <halt>:
SYSCALL(halt)
 762:	b8 18 00 00 00       	mov    $0x18,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 779:	85 d2                	test   %edx,%edx
{
 77b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 77e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 780:	79 76                	jns    7f8 <printint+0x88>
 782:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 786:	74 70                	je     7f8 <printint+0x88>
    x = -xx;
 788:	f7 d8                	neg    %eax
    neg = 1;
 78a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 791:	31 f6                	xor    %esi,%esi
 793:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 796:	eb 0a                	jmp    7a2 <printint+0x32>
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 7a0:	89 fe                	mov    %edi,%esi
 7a2:	31 d2                	xor    %edx,%edx
 7a4:	8d 7e 01             	lea    0x1(%esi),%edi
 7a7:	f7 f1                	div    %ecx
 7a9:	0f b6 92 14 0d 00 00 	movzbl 0xd14(%edx),%edx
  }while((x /= base) != 0);
 7b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 7b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 7b5:	75 e9                	jne    7a0 <printint+0x30>
  if(neg)
 7b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 7ba:	85 c0                	test   %eax,%eax
 7bc:	74 08                	je     7c6 <printint+0x56>
    buf[i++] = '-';
 7be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 7c3:	8d 7e 02             	lea    0x2(%esi),%edi
 7c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 7ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
 7d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
 7d6:	83 ee 01             	sub    $0x1,%esi
 7d9:	6a 01                	push   $0x1
 7db:	53                   	push   %ebx
 7dc:	57                   	push   %edi
 7dd:	88 45 d7             	mov    %al,-0x29(%ebp)
 7e0:	e8 ed fe ff ff       	call   6d2 <write>

  while(--i >= 0)
 7e5:	83 c4 10             	add    $0x10,%esp
 7e8:	39 de                	cmp    %ebx,%esi
 7ea:	75 e4                	jne    7d0 <printint+0x60>
    putc(fd, buf[i]);
}
 7ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ef:	5b                   	pop    %ebx
 7f0:	5e                   	pop    %esi
 7f1:	5f                   	pop    %edi
 7f2:	5d                   	pop    %ebp
 7f3:	c3                   	ret    
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 7ff:	eb 90                	jmp    791 <printint+0x21>
 801:	eb 0d                	jmp    810 <printf>
 803:	90                   	nop
 804:	90                   	nop
 805:	90                   	nop
 806:	90                   	nop
 807:	90                   	nop
 808:	90                   	nop
 809:	90                   	nop
 80a:	90                   	nop
 80b:	90                   	nop
 80c:	90                   	nop
 80d:	90                   	nop
 80e:	90                   	nop
 80f:	90                   	nop

00000810 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 819:	8b 75 0c             	mov    0xc(%ebp),%esi
 81c:	0f b6 1e             	movzbl (%esi),%ebx
 81f:	84 db                	test   %bl,%bl
 821:	0f 84 b3 00 00 00    	je     8da <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 827:	8d 45 10             	lea    0x10(%ebp),%eax
 82a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 82d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 82f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 832:	eb 2f                	jmp    863 <printf+0x53>
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 838:	83 f8 25             	cmp    $0x25,%eax
 83b:	0f 84 a7 00 00 00    	je     8e8 <printf+0xd8>
  write(fd, &c, 1);
 841:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 844:	83 ec 04             	sub    $0x4,%esp
 847:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 84a:	6a 01                	push   $0x1
 84c:	50                   	push   %eax
 84d:	ff 75 08             	pushl  0x8(%ebp)
 850:	e8 7d fe ff ff       	call   6d2 <write>
 855:	83 c4 10             	add    $0x10,%esp
 858:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 85b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 85f:	84 db                	test   %bl,%bl
 861:	74 77                	je     8da <printf+0xca>
    if(state == 0){
 863:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 865:	0f be cb             	movsbl %bl,%ecx
 868:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 86b:	74 cb                	je     838 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 86d:	83 ff 25             	cmp    $0x25,%edi
 870:	75 e6                	jne    858 <printf+0x48>
      if(c == 'd'){
 872:	83 f8 64             	cmp    $0x64,%eax
 875:	0f 84 05 01 00 00    	je     980 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 87b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 881:	83 f9 70             	cmp    $0x70,%ecx
 884:	74 72                	je     8f8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 886:	83 f8 73             	cmp    $0x73,%eax
 889:	0f 84 99 00 00 00    	je     928 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 88f:	83 f8 63             	cmp    $0x63,%eax
 892:	0f 84 08 01 00 00    	je     9a0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 898:	83 f8 25             	cmp    $0x25,%eax
 89b:	0f 84 ef 00 00 00    	je     990 <printf+0x180>
  write(fd, &c, 1);
 8a1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8a4:	83 ec 04             	sub    $0x4,%esp
 8a7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8ab:	6a 01                	push   $0x1
 8ad:	50                   	push   %eax
 8ae:	ff 75 08             	pushl  0x8(%ebp)
 8b1:	e8 1c fe ff ff       	call   6d2 <write>
 8b6:	83 c4 0c             	add    $0xc,%esp
 8b9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 8bc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 8bf:	6a 01                	push   $0x1
 8c1:	50                   	push   %eax
 8c2:	ff 75 08             	pushl  0x8(%ebp)
 8c5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8c8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 8ca:	e8 03 fe ff ff       	call   6d2 <write>
  for(i = 0; fmt[i]; i++){
 8cf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 8d3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8d6:	84 db                	test   %bl,%bl
 8d8:	75 89                	jne    863 <printf+0x53>
    }
  }
}
 8da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8dd:	5b                   	pop    %ebx
 8de:	5e                   	pop    %esi
 8df:	5f                   	pop    %edi
 8e0:	5d                   	pop    %ebp
 8e1:	c3                   	ret    
 8e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 8e8:	bf 25 00 00 00       	mov    $0x25,%edi
 8ed:	e9 66 ff ff ff       	jmp    858 <printf+0x48>
 8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8f8:	83 ec 0c             	sub    $0xc,%esp
 8fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 900:	6a 00                	push   $0x0
 902:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	8b 17                	mov    (%edi),%edx
 90a:	e8 61 fe ff ff       	call   770 <printint>
        ap++;
 90f:	89 f8                	mov    %edi,%eax
 911:	83 c4 10             	add    $0x10,%esp
      state = 0;
 914:	31 ff                	xor    %edi,%edi
        ap++;
 916:	83 c0 04             	add    $0x4,%eax
 919:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 91c:	e9 37 ff ff ff       	jmp    858 <printf+0x48>
 921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 928:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 92b:	8b 08                	mov    (%eax),%ecx
        ap++;
 92d:	83 c0 04             	add    $0x4,%eax
 930:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 933:	85 c9                	test   %ecx,%ecx
 935:	0f 84 8e 00 00 00    	je     9c9 <printf+0x1b9>
        while(*s != 0){
 93b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 93e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 940:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 942:	84 c0                	test   %al,%al
 944:	0f 84 0e ff ff ff    	je     858 <printf+0x48>
 94a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 94d:	89 de                	mov    %ebx,%esi
 94f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 952:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 955:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 958:	83 ec 04             	sub    $0x4,%esp
          s++;
 95b:	83 c6 01             	add    $0x1,%esi
 95e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 961:	6a 01                	push   $0x1
 963:	57                   	push   %edi
 964:	53                   	push   %ebx
 965:	e8 68 fd ff ff       	call   6d2 <write>
        while(*s != 0){
 96a:	0f b6 06             	movzbl (%esi),%eax
 96d:	83 c4 10             	add    $0x10,%esp
 970:	84 c0                	test   %al,%al
 972:	75 e4                	jne    958 <printf+0x148>
 974:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 977:	31 ff                	xor    %edi,%edi
 979:	e9 da fe ff ff       	jmp    858 <printf+0x48>
 97e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 980:	83 ec 0c             	sub    $0xc,%esp
 983:	b9 0a 00 00 00       	mov    $0xa,%ecx
 988:	6a 01                	push   $0x1
 98a:	e9 73 ff ff ff       	jmp    902 <printf+0xf2>
 98f:	90                   	nop
  write(fd, &c, 1);
 990:	83 ec 04             	sub    $0x4,%esp
 993:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 996:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 999:	6a 01                	push   $0x1
 99b:	e9 21 ff ff ff       	jmp    8c1 <printf+0xb1>
        putc(fd, *ap);
 9a0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 9a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9a6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 9a8:	6a 01                	push   $0x1
        ap++;
 9aa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 9ad:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 9b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 9b3:	50                   	push   %eax
 9b4:	ff 75 08             	pushl  0x8(%ebp)
 9b7:	e8 16 fd ff ff       	call   6d2 <write>
        ap++;
 9bc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 9bf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9c2:	31 ff                	xor    %edi,%edi
 9c4:	e9 8f fe ff ff       	jmp    858 <printf+0x48>
          s = "(null)";
 9c9:	bb 0c 0d 00 00       	mov    $0xd0c,%ebx
        while(*s != 0){
 9ce:	b8 28 00 00 00       	mov    $0x28,%eax
 9d3:	e9 72 ff ff ff       	jmp    94a <printf+0x13a>
 9d8:	66 90                	xchg   %ax,%ax
 9da:	66 90                	xchg   %ax,%ax
 9dc:	66 90                	xchg   %ax,%ax
 9de:	66 90                	xchg   %ax,%ax

000009e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e1:	a1 48 10 00 00       	mov    0x1048,%eax
{
 9e6:	89 e5                	mov    %esp,%ebp
 9e8:	57                   	push   %edi
 9e9:	56                   	push   %esi
 9ea:	53                   	push   %ebx
 9eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f8:	39 c8                	cmp    %ecx,%eax
 9fa:	8b 10                	mov    (%eax),%edx
 9fc:	73 32                	jae    a30 <free+0x50>
 9fe:	39 d1                	cmp    %edx,%ecx
 a00:	72 04                	jb     a06 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a02:	39 d0                	cmp    %edx,%eax
 a04:	72 32                	jb     a38 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a06:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a09:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a0c:	39 fa                	cmp    %edi,%edx
 a0e:	74 30                	je     a40 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a10:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a13:	8b 50 04             	mov    0x4(%eax),%edx
 a16:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a19:	39 f1                	cmp    %esi,%ecx
 a1b:	74 3a                	je     a57 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a1d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a1f:	a3 48 10 00 00       	mov    %eax,0x1048
}
 a24:	5b                   	pop    %ebx
 a25:	5e                   	pop    %esi
 a26:	5f                   	pop    %edi
 a27:	5d                   	pop    %ebp
 a28:	c3                   	ret    
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a30:	39 d0                	cmp    %edx,%eax
 a32:	72 04                	jb     a38 <free+0x58>
 a34:	39 d1                	cmp    %edx,%ecx
 a36:	72 ce                	jb     a06 <free+0x26>
{
 a38:	89 d0                	mov    %edx,%eax
 a3a:	eb bc                	jmp    9f8 <free+0x18>
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a40:	03 72 04             	add    0x4(%edx),%esi
 a43:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a46:	8b 10                	mov    (%eax),%edx
 a48:	8b 12                	mov    (%edx),%edx
 a4a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a4d:	8b 50 04             	mov    0x4(%eax),%edx
 a50:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a53:	39 f1                	cmp    %esi,%ecx
 a55:	75 c6                	jne    a1d <free+0x3d>
    p->s.size += bp->s.size;
 a57:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a5a:	a3 48 10 00 00       	mov    %eax,0x1048
    p->s.size += bp->s.size;
 a5f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a62:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a65:	89 10                	mov    %edx,(%eax)
}
 a67:	5b                   	pop    %ebx
 a68:	5e                   	pop    %esi
 a69:	5f                   	pop    %edi
 a6a:	5d                   	pop    %ebp
 a6b:	c3                   	ret    
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	57                   	push   %edi
 a74:	56                   	push   %esi
 a75:	53                   	push   %ebx
 a76:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a79:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a7c:	8b 15 48 10 00 00    	mov    0x1048,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a82:	8d 78 07             	lea    0x7(%eax),%edi
 a85:	c1 ef 03             	shr    $0x3,%edi
 a88:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a8b:	85 d2                	test   %edx,%edx
 a8d:	0f 84 9d 00 00 00    	je     b30 <malloc+0xc0>
 a93:	8b 02                	mov    (%edx),%eax
 a95:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a98:	39 cf                	cmp    %ecx,%edi
 a9a:	76 6c                	jbe    b08 <malloc+0x98>
 a9c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 aa2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 aa7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 aaa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 ab1:	eb 0e                	jmp    ac1 <malloc+0x51>
 ab3:	90                   	nop
 ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 aba:	8b 48 04             	mov    0x4(%eax),%ecx
 abd:	39 f9                	cmp    %edi,%ecx
 abf:	73 47                	jae    b08 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac1:	39 05 48 10 00 00    	cmp    %eax,0x1048
 ac7:	89 c2                	mov    %eax,%edx
 ac9:	75 ed                	jne    ab8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 acb:	83 ec 0c             	sub    $0xc,%esp
 ace:	56                   	push   %esi
 acf:	e8 66 fc ff ff       	call   73a <sbrk>
  if(p == (char*)-1)
 ad4:	83 c4 10             	add    $0x10,%esp
 ad7:	83 f8 ff             	cmp    $0xffffffff,%eax
 ada:	74 1c                	je     af8 <malloc+0x88>
  hp->s.size = nu;
 adc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 adf:	83 ec 0c             	sub    $0xc,%esp
 ae2:	83 c0 08             	add    $0x8,%eax
 ae5:	50                   	push   %eax
 ae6:	e8 f5 fe ff ff       	call   9e0 <free>
  return freep;
 aeb:	8b 15 48 10 00 00    	mov    0x1048,%edx
      if((p = morecore(nunits)) == 0)
 af1:	83 c4 10             	add    $0x10,%esp
 af4:	85 d2                	test   %edx,%edx
 af6:	75 c0                	jne    ab8 <malloc+0x48>
        return 0;
  }
}
 af8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 afb:	31 c0                	xor    %eax,%eax
}
 afd:	5b                   	pop    %ebx
 afe:	5e                   	pop    %esi
 aff:	5f                   	pop    %edi
 b00:	5d                   	pop    %ebp
 b01:	c3                   	ret    
 b02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b08:	39 cf                	cmp    %ecx,%edi
 b0a:	74 54                	je     b60 <malloc+0xf0>
        p->s.size -= nunits;
 b0c:	29 f9                	sub    %edi,%ecx
 b0e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b11:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b14:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 b17:	89 15 48 10 00 00    	mov    %edx,0x1048
}
 b1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b20:	83 c0 08             	add    $0x8,%eax
}
 b23:	5b                   	pop    %ebx
 b24:	5e                   	pop    %esi
 b25:	5f                   	pop    %edi
 b26:	5d                   	pop    %ebp
 b27:	c3                   	ret    
 b28:	90                   	nop
 b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 b30:	c7 05 48 10 00 00 4c 	movl   $0x104c,0x1048
 b37:	10 00 00 
 b3a:	c7 05 4c 10 00 00 4c 	movl   $0x104c,0x104c
 b41:	10 00 00 
    base.s.size = 0;
 b44:	b8 4c 10 00 00       	mov    $0x104c,%eax
 b49:	c7 05 50 10 00 00 00 	movl   $0x0,0x1050
 b50:	00 00 00 
 b53:	e9 44 ff ff ff       	jmp    a9c <malloc+0x2c>
 b58:	90                   	nop
 b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 b60:	8b 08                	mov    (%eax),%ecx
 b62:	89 0a                	mov    %ecx,(%edx)
 b64:	eb b1                	jmp    b17 <malloc+0xa7>
