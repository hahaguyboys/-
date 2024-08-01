<template>
  <div class="head2">
    <el-container>
      <el-header
        style="display: flex; height: 100px; background-color: #bbffff;border-radius:15px;
            box-shadow: 2px 2px 2px 2px #BEBEBE;">
        <i
          class="el-icon-user"
          style="
            font-size: 40px;
            height: 40px;
            align-self: center;
            margin-left: 50px;
          "
        >
        </i>
        <h3 style="margin-left: 5px; align-self: center">信息管理</h3>

        <el-drawer title="我是标题" :visible.sync="drawer" :with-header="false">
          <div style="margin: 10px 10px 10px 10px">
            <el-button
              type="primary"  
              icon="el-icon-s-opportunity"
              style="color: white"
              >提示</el-button
            >
            <div style="margin-top: 20px">
              <el-button
                type="info"
                icon="el-icon-user-solid"
                circle
                @click="back"
              ></el-button
              ><h style="">：此按钮返回管理员中心</h>
            </div>
            <div style="margin-top: 15px">
              <el-button type="primary" icon="el-icon-thumb" circle></el-button
              ><h style="">：此按钮打开提示</h>
            </div>
            <div style="margin-top: 15px">
              <el-button
                type="primary"
                icon="el-icon-refresh-right"
                circle
              ></el-button
              ><h style="">：此按钮刷新数据</h>
            </div>
          </div>
        </el-drawer>
        <el-button
          type="primary"
          round
          @click="Adminout"
          style="height: 40px; align-self: center; margin-left: 950px"
          >退出</el-button
        >
      </el-header>
      <el-container class="aside" style="height: 740px; margin-top: 10px" >
        <el-aside style="display: block;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
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

        <el-main style="overflow: hidden;">
          <el-button
            type="info"
            icon="el-icon-user-solid"
            circle
            @click="back"
          ></el-button>
          <el-button
            @click="drawer = true"
            type="primary"
            icon="el-icon-thumb"
            circle
          ></el-button>
          <el-button
            type="primary"
            icon="el-icon-refresh-right"
            circle
            @click="load" 
          ></el-button>
          <hr style="margin: 10px 0px 10px 0px" />
          <el-input
            placeholder="账户名查询"
            v-model="inputSelect1"
            @change="selectInput"
            prefix-icon="el-icon-search"
            style="width: 200px"
            clearable
          >
          </el-input>
          <el-input
            placeholder="性别查询"
            v-model="inputSelect2"
            @change="selectInput"
            prefix-icon="el-icon-search"
            style="width: 200px; margin-left: 20px"
            clearable
          >
          </el-input>
          <el-table :data="tableData" border 
          v-loading="loading"
          style="width: 100%; border-radius: 15px; margin-top: 10px;border: 2px solid #ccc" 
          max-height="575px">
            <el-table-column
              fixed
              prop="lastModifiedTime"
              label="日期"
              sortable
              width="150"
            >
            </el-table-column>
            <el-table-column prop="username" label="用户名" sortable width="120">
            </el-table-column>
            <el-table-column
              prop="contactPhonenumber"
              label="联系方式"
              width="120"
            >
            </el-table-column>
            <el-table-column prop="gender" label="性别" width="50px">
            </el-table-column>
            <el-table-column prop="address" label="地址" width="300">
            </el-table-column>
            
            <el-table-column fixed="right" label="操作" width="100">
              <template slot-scope="scope">
              <el-button @click="handleClick(scope.row)" type="primary" round size="mini">查看</el-button>
              </template>
            </el-table-column>
          </el-table>

          <el-dialog :visible.sync="dialogVisible" title="用户信息">
              <el-form ref="form" :model="form" label-width="120px">
                <el-form-item label="用户名">
                  <el-input v-model="form.username" disabled="disabled" style="font-size: 25px;"></el-input>
                </el-form-item>

                <el-form-item label="联系方式">
                  <el-input v-model="form.contactPhonenumber" disabled="disabled" style="font-size: 25px;"></el-input>
                </el-form-item>

                <el-form-item label="地区">
                  <el-input v-model="form.address" disabled="disabled" style="font-size: 25px;"></el-input>
                </el-form-item>

                <el-form-item label="性别">
                  <el-input v-model="form.gender" disabled="disabled" style="font-size: 25px;"></el-input>
                </el-form-item>

                <el-form-item label="日期">
                  <el-input v-model="form.lastModifiedTime" disabled="disabled" style="font-size: 25px;"></el-input>
                </el-form-item>
              </el-form>
            </el-dialog>

        </el-main>
      </el-container>
    </el-container>
  </div>
</template>
  
  <script>
import axios from "axios";
export default {
  data() {
    return {
      loading:true,
      inputSelect1: '',
      inputSelect2: '',
      drawer: false,
      dialogVisible: false,
      tableData: [],
      form: {},
      value1: "",
    };
  },
  methods: {
  selectInput() {
        const name = this.inputSelect1 || ''; // 如果没有输入则传递 'null'
        const gender = this.inputSelect2 || ''; // 如果没有输入则传递 'null'
        axios.get(`http://localhost:8080/User/selectUser?name=${name}&gender=${gender}`)
          .then(response => {
            console.log(response.data)
            this.tableData = response.data.data;
          })
          .catch(error => {
            console.error('查询失败:', error);
            this.$message.error('查询失败!');
          });
      },
    handleClick(row) {
      this.form = { ...row }; // 使用展开运算符复制行数据到表单
      this.dialogVisible = true; // 打开对话框
    },
    back() {
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
      axios.get("http://localhost:8080/User/list").then((result) => {
          this.tableData=result.data.data
          this.$message({
          showClose: true,
          message: '数据已加载',
          type: 'success'
        });
      });
      this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 1000);
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
  overflow: hidden;
}
</style>