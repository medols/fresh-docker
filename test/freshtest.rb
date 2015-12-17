fresh(
	proc{
		7.times{|i|
coef = [1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2]
			val=[0]
			gr2=[1,2,3]
			ch2=[0,0]
			ms2=[0,0,0]
			mpi_gather ch2 , ms2 , gr2
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
			mpi_gather ch1 , ms1 , gr1
			ms2[1]=ms1[0]*coef[1]+ms1[1]*coef[2]
			mpi_bcast ms2 , gr2
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
			mpi_gather ch1 , ms1 , gr1
			ms2[1]=ms1[0]*coef[3]+ms1[1]*coef[4]
			mpi_bcast ms2 , gr2
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
			mpi_gather ch1 , ms1 , gr1
			ms2[1]=ms1[0]*coef[5]+ms1[1]*coef[6]
			mpi_bcast ms2 , gr2
		}
	},
	proc{
		7.times{|i|
			gr1=[1,2,3]
			ms1=[0,32]
			val=[4,2,3,8,4,6,1]
			ms1[1]=val[i]
			mpi_bcast ms1 , gr1
		}
	},
	proc{
		7.times{|i|
			gr1=[1,2,3]
			ms1=[1,32]
			val=[2,4,8,16,32,64,48]
			ms1[1]=val[i]
			mpi_bcast ms1 , gr1
		}
	}
)

