puts (proc{ |rank,size|
      7.times.map{|i|
        coef=[1,2,1,2,1,2,3,2,3,2]
        val0=[0]
        val1=[4,2,3,8,4,6,1]
        val2=[2,4,8,16,32,64,48]

        sbuf1=[0]
        rbuf1=[0,0]
        root1=[4,5]
        comm1=[1,2,3]

        sbuf1[0]=val1[i] if rank==4
        sbuf1[0]=val2[i] if rank==5
        mpi_allgatherv sbuf1 , rbuf1 , root1 , comm1 , rank

        sbuf2=[0]
        rbuf2=[0,0,0]
        root2=0
        comm2=[1,2,3]

        sbuf2[0]=rbuf1[0]*coef[2*rank-1]+rbuf1[1]*coef[2*rank] if comm2.include? rank
        mpi_gatherv sbuf2 , rbuf2 , root2 , comm2 , rank

        val0[0] = rbuf2[0]*coef[7] + rbuf2[1]*coef[8] + rbuf2[2]*coef[9]
        val0
      }
    }*6).first.to_s
