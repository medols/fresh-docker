fresh [
	proc{
		7.times{|i|
coef = [1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2]
			val=[0]
			gr2=[1,2,3]
			ch2=[0,0]
			ms2=[0,0,0]
			mpi_gather_recv gr2 , ms2 , ch2
			val[0] = ms2[0]*coef[7] + ms2[1]*coef[8] + ms2[2]*coef[9]
			puts val
		}
	},
	proc{
		7.times{|i|
coef = [1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2]
			gr1=[4,5]
			ch1=[0,0]
			ms1=[0,0]
			gr2=[0]
			ms2=[0,10]
			mpi_gather_recv gr1 , ms1 , ch1
			ms2[1]=ms1[0]*coef[1]+ms1[1]*coef[2]
			mpi_gather_send gr2 , ms2
		}
	},
	proc{
		7.times{|i|
coef = [1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2]
			gr1=[4,5]
			ch1=[0,0]
			ms1=[0,0]
			gr2=[0]
			ms2=[1,11]
			mpi_gather_recv gr1 , ms1 , ch1
			ms2[1]=ms1[0]*coef[3]+ms1[1]*coef[4]
			mpi_gather_send gr2 , ms2
		}
	},
	proc{
		7.times{|i|
coef = [1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2]
			gr1=[4,5]
			ch1=[0,0]
			ms1=[0,0]
			gr2=[0]
			ms2=[2,12]
			mpi_gather_recv gr1 , ms1 , ch1
			ms2[1]=ms1[0]*coef[5]+ms1[1]*coef[6]
			mpi_gather_send gr2 , ms2
		}
	},
	proc{
		7.times{|i|
			gr1=[1,2,3]
			ms1=[0,32]
			val=[4,2,3,8,4,6,1]
			ms1[1]=val[i]
			mpi_gather_send gr1 , ms1
		}
	},
	proc{
		7.times{|i|
			gr1=[1,2,3]
			ms1=[1,32]
			val=[2,4,8,16,32,64,48]
			ms1[1]=val[i]
			mpi_gather_send gr1 , ms1
		}
	}

]

