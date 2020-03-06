Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vbguest.auto_update = false
  config.vm.provision "shell",
                      inline: "pacman -Sy --noconfirm python"
  ansible_vars = {
    user_name: ENV["USER"],
    user_home: "/home/#{ENV["USER"]}",
    user_shell: "/usr/bin/zsh",
    user_local_pubkey: "#{ENV["HOME"]}/.ssh/id_rsa.pub",
    user_packages: [
      "vim",
      "emacs",
      "zsh"
    ],
    user_repos: [
      {
        repo: "https://github.com/oholiab/zsh",
        destination: ".zsh",
        post_clone: "make"
      },
      {
        repo: "https://github.com/danielmiessler/SecLists",
        destination: "SecLists",
        post_clone: "true"
      }
    ]
  }
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "server/ansible/bootstrap.yml"
    ansible.become = true
    ansible.verbose = true
    ansible.extra_vars = ansible_vars
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "server/ansible/user.yml"
    ansible.become_user = ENV["USER"]
    ansible.become = true
    ansible.verbose = true
    ansible.extra_vars = ansible_vars
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "server/ansible/tools.yml"
    ansible.become = true
    ansible.verbose = true
    ansible.extra_vars = ansible_vars
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "server/ansible/aurbuild.yml"
    ansible.become = true
    ansible.verbose = true
    ansible.extra_vars = ansible_vars
  end
end
