/*
 * date.x - Specification of remote date, time, date and time service.
 */

/*
 * Define 1 procedure :
 * date_1() accepts a long and returns a string. 
 */

 struct stats { 
       string time_str<100>;
    float cpu_usage;
    long mem_total;
    long mem_free;
    double load_avg;

};

program DATE_PROG {
    version DATE_VERS {
	/* string	DATE(long) = 1; */    /* procedure number = 1 */ 
      struct stats GET_STATS(long) = 1;
    } = 1;			                /* version number = 1     */
} = 0x31234567;			   /* program number        */



