const view_post_modal = document.querySelector('#view_post_modal');
      const apply_btn = document.querySelector('#apply_btn');

      const view_post_modal_date = document.querySelector('#view_post_modal_date');
      const view_post_modal_title = document.querySelector('#view_post_modal_title');
      const view_post_modal_desc = document.querySelector('#view_post_modal_desc');
      const view_post_modal_tags = document.querySelector('#view_post_modal_tags');
      const view_post_modal_deadline = document.querySelector('#view_post_modal_deadline');
      let amt = document.querySelector('#amt');

      let post_id = null;
      let freelancer_id = null;
      let bid_amount = null;
      
      function view(pst_id) {
        const subcategory_id = document.querySelector('#subcategory_id_'+pst_id).value;
        const category_id_ = document.querySelector('#category_id_'+pst_id).value;
        const client_id = document.querySelector('#user_id_'+pst_id).value;
        post_id = document.querySelector('#post_id_'+pst_id).value;
        freelancer_id = document.querySelector('#freelancer_id').value;
        
        view_post_modal_title.innerHTML = document.querySelector('#name_'+pst_id).value;
        view_post_modal_desc.innerHTML = document.querySelector('#description_'+pst_id).value;
        view_post_modal_deadline.innerHTML = document.querySelector('#deadline_'+pst_id).value;
        view_post_modal_date.innerHTML = document.querySelector('#date_'+pst_id).value;

        $('#view_post_modal').modal('show');
      }

      const saveBid =  async () => {
            console.log('ready to fireeeeeeeeeeeeeeeeeeeee');
            console.log(amt.value+post_id+freelancer_id);
            // let resp = await fetch('save_project.do?title='+class_title+'&description='+class_description+'&subcategory_id='+subcategory_id+'&ptitle='+class_ptitle+'&pdescription='+class_pdescription+'&delivery='+class_delivery+'&revisions='+class_revisions+'&price='+class_price);
            const obj = {bidAmount: amt.value, post: {postId: post_id}, user: {userId: freelancer_id}};        
            var str = JSON.stringify(obj);
            let resp = await fetch('save_bid.do?bid_data='+encodeURIComponent(str));

            let result = resp.text();
            return result;
        }

        

      apply_btn.addEventListener('click',()=>{
        console.log(amt.value);
        // console.log(view_post_modal_title.innerHTML+"-"+view_post_modal_desc.innerHTML+"-"+view_post_modal_deadline.innerHTML+"-"+view_post_modal_date.innerHTML);
        saveBid().then((data)=>{
                console.log(data);
            }).catch((error)=>{
                console.log(error);
            });
            $('#view_post_modal').modal('hide');
      });



      // iiiiiiiiiiiiiiiiiiiiiiiiiii
    $(document).ready(function() {
   
      var options = {
        autoClose: true,
        progressBar: true,
        enableSounds: true,
        sounds: {
          success: "https://res.cloudinary.com/dxfq3iotg/video/upload/v1557233524/success.mp3",
          }, 
      };
      var toast = new Toasty(options);
      toast.configure(options);
      
      $('#apply_btn').click(function() {
          toast.success("Congratulations!! Bidding applied succesfully");
      });
       
    });