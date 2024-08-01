<template>
    <div class="head2"> 
      <el-container>
        <el-header style="display: flex; height: 100px; background-color:#96CDCD ;border-radius:15px;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
          <i
            class="el-icon-user"
            style="
              font-size: 40px;
              height: 40px;
              align-self: center;
              margin-left: 50px;">
          </i>
          <h3 style="margin-left: 5px; align-self: center">投诉管理</h3>
        <el-drawer
           title="我是标题"
            :visible.sync="drawer"
              :with-header="false">
              <div style="margin: 10px 10px 10px 10px;">
                  <el-button type="primary" icon="el-icon-s-opportunity"  style="color: white;">提示</el-button>
                  <div style="margin-top: 20px"><el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button><h style="">：此按钮返回管理员中心</h></div>
                  <div style="margin-top: 15px"><el-button type="primary" icon="el-icon-thumb" circle></el-button><h style="">：此按钮打开提示</h></div>
                  <div style="margin-top: 15px"><el-button type="primary" icon="el-icon-refresh-right" circle ></el-button><h style="">：此按钮刷新数据</h></div>
                </div>
            </el-drawer>
          <el-button type="primary" round @click="Adminout" style="height: 40px; align-self: center; margin-left: 950px;"
            >退出</el-button>
        </el-header>
        <el-container class="aside" style="margin-top: 10px;" >
          <el-aside style="display: block;box-shadow: 2px 2px 2px 2px #BEBEBE;">
            <el-menu background-color=#fff text-color="black" unique-opened="true" style="height: 100%;">
              <el-submenu index="1">
                <template slot="title">
                  <i class="el-icon-user" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">用户管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="1-1" style="text-align: center"><router-link to="/InfoUser" style="color: black;">用户信息管理</router-link></el-menu-item>
                  <el-menu-item index="1-2" style="text-align: center"><router-link to="/AppUser" style="color: black;">用户申请管理</router-link>
                    </el-menu-item>
                  <el-menu-item index="1-3" style="text-align: center"><router-link to="/ComplaintsUser" style="color: black;">用户投诉管理</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              <el-submenu index="2">
                <template slot="title">
                  <i class="el-icon-chicken" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">宠物管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="2-1" style="text-align: center"><router-link to="/AdminPetInfo" style="color: black;">宠物信息管理</router-link></el-menu-item>
                  <el-menu-item index="2-2" style="text-align: center"><router-link to="/AdminPetApp" style="color: black;">宠物领养情况</router-link></el-menu-item>
                  <el-menu-item index="2-3" style="text-align: center"><router-link to="/PetTag" style="color: black;">宠物标签情况</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              <el-submenu index="3">
                <template slot="title">
                  <i class="el-icon-bell" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">通知管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="3-1" style="text-align: center"><router-link to="/AdminNotification" style="color: black;">用户通知</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              
              <el-submenu index="4">
                <template slot="title">
                  <i class="el-icon-document-remove" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">数据统计</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="4-1" style="text-align: center;"><router-link to="/petCount" style="color: black;">领养统计</router-link></el-menu-item>
                 
                </el-menu-item-group>
              </el-submenu>
            </el-menu>
          </el-aside>
  
          <el-main style="">
            <el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button>
            <el-button @click="drawer = true" type="primary" icon="el-icon-thumb" circle></el-button>
            <el-button type="primary" icon="el-icon-refresh-right" circle @click="load"></el-button>
            <el-button type="primary" icon="el-icon-success" circle ></el-button>
            <el-button type="primary" icon="el-icon-error" circle ></el-button>
            <hr style="margin: 10px 0px 10px 0px;">
            <div style="display: flex">
            <el-input
                placeholder="账户名查询"
                v-model="inputSelect1"
                @change="selectInput"
                prefix-icon="el-icon-search"
                style="width: 200px;"
                clearable>
            </el-input>
            <el-select 
                    v-model="inputSelect2" @change="selectInput" placeholder="请选择领养状态"
                    style="margin-left: 10px;">
                    <el-option label="未处理" :value=0></el-option>
                    <el-option label="已处理" :value=1></el-option>
                    <el-option label="正在处理" :value=2></el-option>
            </el-select>
            
            <el-button type="danger" icon="el-icon-delete" circle size="mini" @click="setNull"
                        style="font-size: 20px; margin-left: 10px"
            ></el-button>
          </div>
            <el-table
                    :data="tableData"
                    v-loading="loading"
                    border
                    style="width: 100%; border-radius: 15px; margin-top: 10px;border: 2px solid #ccc" 
                    max-height="570px">
                    <el-table-column
                    prop="notificationId"
                    sortable
                    label="投诉编号"
                    width="120">
                    </el-table-column>
                    <el-table-column
                    fixed
                    prop="notificationTime"
                    sortable
                    label="日期"
                    width="150">
                    </el-table-column>
                    <el-table-column
                    prop="username"
                    sortable
                    label="用户名"
                    width="120">
                    </el-table-column>
                    <el-table-column
                    prop="adoptionStatus"
                    label="投诉状态"
                    width="120">
                    <template slot-scope="scope">
                          <span v-if="scope.row.adoptionStatus == 1" style="color:#228B22;">已办理</span>
                          <span v-else-if="scope.row.adoptionStatus == 0" style="color: #FF4500;">未办理</span>
                          <span v-else-if="scope.row.adoptionStatus == 2" style="color: #FF7F24;">正在办理</span>
                      </template>
                    </el-table-column>
                    <el-table-column
                    prop="notificationContent"
                    label="投诉内容"
                    width="360">
                    </el-table-column>
                    <el-table-column
                    fixed="right"
                    label="操作"
                    width="100">
                    <template slot-scope="scope">
                    <el-button @click="complaintsUser(scope.row)" type="text" size="small">查看</el-button>
                    <el-button type="text" size="small" @click="openStatus(scope.row)">编辑</el-button>
                </template>
                </el-table-column>
            </el-table>

            <el-dialog :visible.sync="text1" title="投诉内容">
              <el-form ref="from1" :model="from1" label-width="120px">
                <el-form-item label="投诉编号">
                  <el-input v-model="from1.notificationId" ></el-input>
                </el-form-item> 
                <el-form-item label="投诉内容">
                  <el-input type="textarea" v-model="from1.notificationContent"></el-input>
                </el-form-item>
              </el-form>
            </el-dialog>

            <el-dialog :visible.sync="change" title="投诉处理">
              <el-form ref="from2" :model="from2" label-width="120px">
                <el-form-item label="用户编号">
                  <el-input v-model="from2.userId" ></el-input>
                </el-form-item> 
                <el-form-item>
                  <el-select v-model="from2.adoptionStatus" placeholder="请选择领养状态">
                    <el-option label="未办理" :value=0></el-option>
                    <el-option label="已办理" :value=1></el-option>
                    <el-option label="正在办理" :value=2></el-option>
                  </el-select>
                </el-form-item>
              <el-form-item>
                    <el-button type="primary" @click="changeStatus('from2')">保存</el-button>
              </el-form-item>
              </el-form>
            </el-dialog>


        </el-main>


        </el-container>
      </el-container>
    </div>
  </template>
  
  <script>
import axios from 'axios';
  export default {
    data() {
      return {
        loading:false,
        change:false,
        text1:false,
        inputSelect1:'',
        inputSelect2:'',
        from1:{
          notificationId:1,
          notificationContent:''
        },
        from2:{
          adoptionStatus:0,
          userId:1,
        },
        drawer: false,
        tableData: [{
        }],
        }
    },
    methods: {
    openStatus(row){
      this.change=true
      console.log(row)
      this.from2 = { ...row };
      console.log("1111",this.from2)
    },
    changeStatus(formName){
      console.log("1111",this.form2)
      const notificationId= this.from2.notificationId
      const adoptionStatus= this.from2.adoptionStatus
      const userId=this.from2.userId
      const params = {
            notificationId,
            adoptionStatus,
            userId    
      };
      console.log(params)
      this.$refs[formName].validate((valid) => {
          if (valid) {
            // 提交表单数据到服务器 
            axios.put(
              'http://localhost:8080/Common/changeComStatus', 
              params
            )
              .then(response => {
                if (response.status === 200) {
                  this.$message.success('提交成功!');
                  this.change = false;
                  console.log("2222222222",params)
                } else {
                  this.$message.error('提交失败!');
                }
              })
              .catch(error => {
                console.error('提交失败:', error);
              });
          } else {
            console.log('提交失败!!');
            return false;
          }
        });
    },
    complaintsUser(row){
      this.text1=true
        axios.get(
          `http://localhost:8080/Common/seeText/${row.notificationId}`,
        )
          .then(response => {
            const Text = response.data.data[0];
            this.from1 = {
              notificationId: Text.notificationId,
              notificationContent: Text.notificationContent,
          }
      })
          .catch(error => {
            console.error('获取健康信息失败:', error);
            this.text1=false
            this.$alert('是否添加', '获取健康信息失败', {
            confirmButtonText: '确定',
            callback: action => {
              this.$message({
                type: 'info',
                message: `action: ${ action }`
              });
              this.addHFun();
            }
          });
            this.$message.error('获取健康信息失败!');
          });
    },
    setNull(){
      this.inputSelect2=null
      this.inputSelect1=null
    },
    selectInput() {
        const username = this.inputSelect1 || '';
        const adoptionStatus = this.inputSelect2 || 3;
        const params = {
          username,
          adoptionStatus
        };
        const url = 'http://localhost:8080/Common/selectDyComplains';
        console.log(params)
        axios.get(url, {params})
          .then(response => {
            this.tableData = response.data.data;
          })
          .catch(error => {
            console.error('查询失败:', error);
            this.$message.error('查询失败!');
          });
      },
    back(){
      this.$router.push({ name: "AdminCenter" });
    },
      Adminout() {
        this.$confirm("您要退出账号吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            this.$router.push({ name: "LoginUi" });
            this.$message({
              type: "success",
              message: "退出成功!",
            });
          })
          .catch(() => {
            this.$message({
              type: "info",
              message: "已取消操作",
            });
          });
      },
      load(){
        this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 1000);
      axios.get("http://localhost:8080/User/selectComplains").then((result) => {
          this.tableData=result.data.data
          this.$message({
          showClose: true,
          message: '数据已加载',
          type: 'success'
        });
      });
    },
    },
    mounted() {
    //发送异步请求，获取数据
    this.load()
  },
};
  </script >
  
  <style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;

  }
  </style>